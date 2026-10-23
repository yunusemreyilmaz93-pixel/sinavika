// Derleme sırasında yayındaki anlatımları anonim anahtarla okur
function env(...names) {
  for (const name of names) if (process.env[name]) return process.env[name]
  return ''
}

export function supabaseConfig() {
  return {
    url: env('VITE_SUPABASE_URL', 'SUPABASE_URL', 'NEXT_PUBLIC_SUPABASE_URL'),
    key: env('VITE_SUPABASE_ANON_KEY', 'SUPABASE_PUBLISHABLE_KEY', 'NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY', 'SUPABASE_ANON_KEY', 'NEXT_PUBLIC_SUPABASE_ANON_KEY'),
  }
}

async function get({ url, key }, path) {
  const res = await fetch(`${url}/rest/v1/${path}`, { headers: { apikey: key, authorization: `Bearer ${key}` } })
  if (!res.ok) throw new Error(`Supabase ${path.split('?')[0]} okunamadı: ${res.status} ${(await res.text()).slice(0, 200)}`)
  return res.json()
}

export async function loadCurriculum() {
  const config = supabaseConfig()
  if (!config.url || !config.key) return null
  try {
    const [subjects, topics, lessons] = await Promise.all([
      get(config, 'subjects?select=id,exam,name,short,question_count,sort&order=sort'),
      get(config, 'topics?select=id,subject_id,name,sort&order=sort&limit=2000'),
      get(config, 'lessons?select=topic_id,body,reading_minutes,updated_at&published=eq.true&limit=2000'),
    ])
    return { subjects, topics, lessons }
  } catch (error) {
    if (process.env.VERCEL) throw error
    console.warn(`SEO: veritabanına ulaşılamadı, anlatım sayfaları üretilmedi (${error.cause?.code ?? error.message})`)
    return null
  }
}
