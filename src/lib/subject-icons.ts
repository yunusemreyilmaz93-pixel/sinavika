// Ders kodundan (tr, mat, fiz...) lucide ikon adına eşleme. Uygulama ve SEO derlemesi birlikte kullanır
export const subjectIconNames: Record<string, string> = {
  tr: 'BookText',
  mat: 'Calculator',
  fen: 'Atom',
  ink: 'Landmark',
  din: 'MoonStar',
  ing: 'Languages',
  fiz: 'Orbit',
  kim: 'FlaskConical',
  bio: 'Dna',
  tar: 'Hourglass',
  tar1: 'Hourglass',
  tar2: 'Hourglass',
  cog: 'Globe',
  cog1: 'Globe',
  cog2: 'Globe',
  fel: 'Lightbulb',
  edb: 'Feather',
  dil: 'Languages',
}

export const subjectIconName = (subjectId: string | undefined | null) => subjectIconNames[subjectId?.split('-')[1] ?? ''] ?? 'Shapes'
