import { Link } from 'react-router'
import { Connect, DataTable, Ek, Formula, Hit, Lead, Question, Section, SelfCheck, SentenceLab, Tip, Video } from '../blocks'
import type { LessonBodyProps, LessonOutline } from '../types'

export const outline: LessonOutline = [
  { id: 'hedefler', title: 'Bu konuda ne öğreneceksin' },
  { id: 'fiilimsi', title: 'Fiilimsi nedir?' },
  { id: 'isim-fiil', title: 'İsim-fiiller' },
  { id: 'sifat-fiil', title: 'Sıfat-fiiller' },
  { id: 'zarf-fiil', title: 'Zarf-fiiller' },
  { id: 'ozet', title: 'Aklında kalsın' },
  { id: 'karistirilanlar', title: 'Sık karıştırılanlar' },
  { id: 'lgs', title: 'LGS’de nasıl sorulur' },
  { id: 'kendini-dene', title: 'Kendini dene' },
]

export default function Fiilimsiler({ role }: LessonBodyProps) {
  return (
    <div className="space-y-12">
      <Section id="hedefler" title="Bu konuda ne öğreneceksin">
        <p>
          Fiilimsiler, bir sözcüğün cümlede ne iş yaptığına bakmayı öğreten bir konudur. Konunun sonunda şunları yapabileceksin:
        </p>
        <ol className="grid gap-2 sm:grid-cols-2">
          {[
            'Fiilimsi ile çekimli fiilin farkını açıklamak.',
            'İsim-fiil, sıfat-fiil ve zarf-fiili cümledeki görevlerine bakarak ayırt etmek.',
            'Aynı ekin bazen fiilimsi, bazen kip eki olabileceğini fark etmek.',
            'Bir cümlede yüklemi ve fiilimsileri birbirinden ayırmak.',
          ].map((goal, i) => (
            <li key={goal} className="flex gap-3 rounded-2xl border border-line bg-surface p-4">
              <span className="grid size-7 shrink-0 place-items-center rounded-lg bg-primary-soft font-display text-sm font-bold text-primary-soft-fg">
                {i + 1}
              </span>
              <span className="text-[15px] leading-relaxed">{goal}</span>
            </li>
          ))}
        </ol>
        <Tip>
          Ek listesini ezberlemeye çalışma. Asıl soru, <strong>sözcüğün cümlede ne iş yaptığı</strong>. Ekleri örnek olarak göreceksin,
          ama doğru cevabı işleve bakarak bulacaksın.
        </Tip>
      </Section>

      <Section id="fiilimsi" number={1} title="Fiilimsi nedir?">
        <p>
          Fiilimsi, fiil kök ya da gövdesine bazı eklerin gelmesiyle oluşur. Fiilden doğar ama cümlede fiil gibi iş görmez. İsim, sıfat
          ya da zarf gibi kullanılır. Aynı fiil kökünden üç farklı fiilimsi türetebilirsin:
        </p>
        <Formula
          items={[
            { root: 'koş', suffix: 'mak', result: 'koşmak', kind: 'İsim-fiil', tone: 'primary' },
            { root: 'koş', suffix: 'an', result: 'koşan', kind: 'Sıfat-fiil', tone: 'accent' },
            { root: 'koş', suffix: 'arak', result: 'koşarak', kind: 'Zarf-fiil', tone: 'warning' },
          ]}
        />
        <Lead title="Fiilimsi, çekimli fiilden nasıl ayrılır?">
          Çekimli fiil zaman ve kişi bildirir, cümlede yüklem olur. Fiilimsi zaman ve kişi bildirmez. Cümlede tek başına yüklem görevi
          görmez.
        </Lead>
        <DataTable
          head={['Özellik', 'Çekimli fiil', 'Fiilimsi']}
          rows={[
            ['Cümledeki görevi', 'Yüklem olur.', 'İsim, sıfat ya da zarf görevi görür.'],
            ['Zaman ve kişi', 'Bildirir. (geldi, gelirim)', 'Bildirmez. (gelmek, gelen, gelerek)'],
            ['Olumsuz yapılabilir mi?', 'Evet. (gelmedi)', 'Evet. (gelmemek, gelmeyen, gelmeden)'],
            ['Örnek cümle', 'Çocuk koştu.', 'Koşan çocuk yoruldu.'],
          ]}
        />
        <Lead title="Fiil özelliklerini korurlar.">
          Fiilimsiler olumsuz yapılabilir. Nesne ve zarf da alabilirler. “Kitap okumak” ifadesinde “kitap”, okumak fiilimsisinin
          nesnesidir. Fiilimsiyle bu sözcükler bir araya gelince <strong>fiilimsi grubu</strong> oluşur.
        </Lead>
        <Connect>
          Bir sözcüğün fiilimsi olup olmadığını anlamak için şunu sor: Bu sözcük cümlede yüklem mi, yoksa başka bir sözcüğe bağlı mı?
          Yüklem değil de başka bir sözcüğe bağlıysa fiilimsi olabilir.
        </Connect>
      </Section>

      <Section id="isim-fiil" number={2} title="İsim-fiiller: İsim gibi kullanılan fiilimsiler">
        <p>
          İsim-fiiller cümlede isim gibi kullanılır. Özne, nesne ya da tümleç olabilirler. İsim gibi davrandıkları için çoğul, iyelik ve
          hâl eki alabilirler.
        </p>
        <p>
          Örnek ekler: <Ek>-mak / -mek</Ek> <Ek>-ma / -me</Ek> <Ek>-ış / -iş / -uş / -üş</Ek>
        </p>
        <DataTable
          head={['Cümledeki görevi', 'Örnek cümle']}
          rows={[
            ['Özne', <>
              <Hit>Koşmak</Hit> sağlığa yararlıdır.
            </>],
            ['Nesne', <>
              Ali <Hit>kitap okumayı</Hit> çok sever.
            </>],
            ['Dolaylı tümleç', <>
              Çocuk <Hit>yüzmekten</Hit> korkuyor.
            </>],
          ]}
        />
        <Tip>
          “Okumayı” sözcüğüne bak: Okuma isim-fiilinin sonuna belirtme hâl eki (-yı) gelmiş. İsim gibi hâl eki alması, bu sözcüğün isim
          görevinde olduğunu gösterir.
        </Tip>
        <Connect>
          “Kitap okumak” gibi bir fiilimsi grubunu cümlenin ögesini bulurken tek parça say. Özneyi ya da nesneyi ararken grubun
          tamamını al.
        </Connect>
      </Section>

      <Section id="sifat-fiil" number={3} title="Sıfat-fiiller: İsmi niteleyen fiilimsiler">
        <p>
          Sıfat-fiiller bir ismin önüne gelir ve onu niteler. “Nasıl?” ya da “Hangi?” sorusuna cevap verirler.
        </p>
        <p>
          Örnek ekler: <Ek>-an / -en</Ek> <Ek>-ası / -esi</Ek> <Ek>-ar / -er</Ek> <Ek>-maz / -mez</Ek> <Ek>-dık / -dik</Ek>{' '}
          <Ek>-acak / -ecek</Ek> <Ek>-mış / -miş</Ek>
        </p>
        <DataTable
          head={['Sıfat-fiil', 'Niteledikleri', 'Örnek cümle']}
          rows={[
            [<>koşan</>, 'çocuk', <>
              <Hit>Koşan</Hit> çocuk yoruldu.
            </>],
            [<>görülesi</>, 'manzara', <>
              Burası <Hit>görülesi</Hit> bir manzara.
            </>],
            [<>akar</>, 'su', <>
              <Hit>Akar</Hit> su yolunu bulur.
            </>],
            [<>bitmez</>, 'enerji', <>
              Onun <Hit>bitmez</Hit> bir enerjisi var.
            </>],
            [<>okuduğum</>, 'kitap', <>
              <Hit>Okuduğum</Hit> kitap çok güzeldi.
            </>],
            [<>gelecek</>, 'hafta', <>
              <Hit>Gelecek</Hit> hafta tatil başlıyor.
            </>],
            [<>yorulmuş</>, 'yolcu', <>
              <Hit>Yorulmuş</Hit> yolcu bir bankta oturdu.
            </>],
          ]}
        />
        <Tip>
          <strong>“Okuduğum” sözcüğünü parçala:</strong> oku + <Ek>-duğ</Ek> + <Ek>-um</Ek>. -duğ sıfat-fiil ekidir. Sondaki -um ise
          iyelik ekidir, kişi eki değildir. “Gördüğüm” ve “okuduğumuz” gibi sözcüklerde de aynı durum var.
        </Tip>
        <Connect>
          -acak, -mış ve -dık ekleri hem sıfat-fiil eki hem de kip eki olabilir. Eke değil, görevine bak. Bir ismin önünde onu
          niteliyorsa sıfat-fiildir. Cümlenin sonunda yüklem olarak duruyorsa kip ekidir.
        </Connect>
      </Section>

      <Section id="zarf-fiil" number={4} title="Zarf-fiiller: Fiili niteleyen fiilimsiler">
        <p>
          Zarf-fiiller cümlede zarf gibi kullanılır ve yüklemi niteler. İş nasıl yapıldı, ne zaman yapıldı gibi soruların cevabını
          verirler.
        </p>
        <div className="grid gap-3 sm:grid-cols-2">
          <div className="rounded-2xl border border-line bg-surface p-4">
            <p className="font-display font-bold text-primary">Nasıl?</p>
            <p className="mt-2 flex flex-wrap gap-1.5">
              <Ek>-arak</Ek> <Ek>-ıp</Ek> <Ek>-madan</Ek> <Ek>-a / -e</Ek> <Ek>-esiye</Ek>
            </p>
            <p className="mt-2 text-[15px] text-muted">gülerek, koşup, yapmadan, koşa koşa</p>
          </div>
          <div className="rounded-2xl border border-line bg-surface p-4">
            <p className="font-display font-bold text-accent">Ne zaman?</p>
            <p className="mt-2 flex flex-wrap gap-1.5">
              <Ek>-ınca</Ek> <Ek>-ken</Ek> <Ek>-dıkça</Ek> <Ek>-ır -maz</Ek>
            </p>
            <p className="mt-2 text-[15px] text-muted">görünce, dönerken, okudukça, gelir gelmez</p>
          </div>
        </div>
        <DataTable
          head={['Zarf-fiil', 'Örnek cümle', 'Sorusu']}
          rows={[
            ['gülerek', <>
              Çocuk <Hit>gülerek</Hit> odaya girdi.
            </>, 'Nasıl girdi?'],
            ['koşa koşa', <>
              Çocuklar <Hit>koşa koşa</Hit> geldi.
            </>, 'Nasıl geldi?'],
            ['yapmadan', <>
              Kahvaltı <Hit>yapmadan</Hit> çıktı.
            </>, 'Nasıl çıktı?'],
            ['görünce', <>
              Seni <Hit>görünce</Hit> sevindim.
            </>, 'Ne zaman sevindim?'],
            ['dönerken', <>
              Eve <Hit>dönerken</Hit> yağmura yakalandık.
            </>, 'Ne zaman yakalandık?'],
            ['gelir gelmez', <>
              Eve <Hit>gelir gelmez</Hit> ödevine başladı.
            </>, 'Ne zaman başladı?'],
          ]}
        />
        <Connect>
          Zarf-fiil yüklemi niteler, yüklemin kendisi değildir. “Çocuk koşarak okula geldi.” cümlesinde yüklem <strong>geldi</strong>.
          Koşarak, geldi fiilinin nasıl yapıldığını anlatan zarf-fiildir.
        </Connect>
      </Section>

      <Section id="ozet" title="Aklında kalsın">
        <SentenceLab
          sentences={[
            [
              { text: 'Kitap' },
              { text: 'okumak,', kind: 'isim', note: 'Cümlenin öznesidir. “Kitap” sözcüğünü nesne olarak almıştır, bu yüzden fiil özelliği taşır.' },
              { text: 'hayal gücünü' },
              { text: 'geliştirir.', kind: 'yuklem', note: 'Çekimli fiildir. Cümlenin yüklemidir.' },
            ],
            [
              { text: 'Parkta' },
              { text: 'koşan', kind: 'sifat', note: '“Çocuk” sözcüğünü niteler. Hangi çocuk? Koşan çocuk.' },
              { text: 'çocuk bana el' },
              { text: 'salladı.', kind: 'yuklem', note: 'Çekimli fiildir. Cümlenin yüklemidir.' },
            ],
            [
              { text: 'Eve' },
              { text: 'gelir gelmez', kind: 'zarf', note: '“Başladı” yüklemini zaman bakımından niteler. Ne zaman başladı? Eve gelir gelmez.' },
              { text: 'ödevine' },
              { text: 'başladı.', kind: 'yuklem', note: 'Çekimli fiildir. Cümlenin yüklemidir.' },
            ],
            [
              { text: 'Dün' },
              { text: 'okuduğum', kind: 'sifat', note: '“Kitap” sözcüğünü niteler. oku + duğ (sıfat-fiil eki) + um (iyelik eki). Kişi eki değildir.' },
              { text: 'kitap çok' },
              { text: 'güzeldi.', kind: 'yuklem', note: 'Ek-fiil almış isimdir. Cümlenin yüklemidir. Bu sözcük fiilimsi değildir.' },
            ],
            [
              { text: 'Çocuk' },
              { text: 'gülerek', kind: 'zarf', note: '“Girdi” yüklemini niteler. Nasıl girdi? Gülerek.' },
              { text: 'odaya' },
              { text: 'girdi.', kind: 'yuklem', note: 'Çekimli fiildir. Cümlenin yüklemidir.' },
            ],
          ]}
        />
        <DataTable
          head={['Tür', 'Cümledeki görevi', 'Cevapladığı soru', 'Örnek']}
          rows={[
            ['İsim-fiil', 'İsim (özne, nesne, tümleç)', 'Ne? Kim?', 'okumak'],
            ['Sıfat-fiil', 'Sıfat', 'Nasıl? Hangi?', 'koşan çocuk'],
            ['Zarf-fiil', 'Zarf', 'Nasıl? Ne zaman?', 'koşarak geldi'],
          ]}
        />
        <ul className="space-y-2">
          {[
            <>Fiilimsi fiil kökünden türer ama <strong>yüklem olmaz</strong>.</>,
            <>
              <strong>İsim-fiil</strong> isim, <strong>sıfat-fiil</strong> sıfat, <strong>zarf-fiil</strong> zarf gibi kullanılır.
            </>,
            <>Ek aynıysa <strong>cümledeki göreve</strong> bak. -acak, -mış ve -dık hem fiilimsi hem kip eki olabilir.</>,
          ].map((item, i) => (
            <li key={i} className="flex gap-3">
              <span className="mt-2.5 size-1.5 shrink-0 rounded-full bg-primary" />
              <span>{item}</span>
            </li>
          ))}
        </ul>
        <Video id="4SFpk_JTiiY" label="Konu anlatımı videosu" title="Fiilimsi, 8. Sınıf Türkçe" channel="Tonguç 8. Sınıf" />
      </Section>

      <Section id="karistirilanlar" title="Sık karıştırılanlar">
        <DataTable
          head={['Karıştırılan', 'Doğrusu']}
          rows={[
            [
              'Gelecek hafta ile Yarın gelecek',
              '“Gelecek hafta” ifadesinde gelecek bir ismi niteler, sıfat-fiildir. “Yarın gelecek.” cümlesinde ise yüklemin sonunda durur ve gelecek zaman kipidir.',
            ],
            [
              'Gördüğüm sözcüğündeki -üm',
              'gör + düğ + üm. -düğ sıfat-fiil ekidir, -üm iyelik ekidir. Kişi eki değildir.',
            ],
            [
              'Gelme! ile Gelmesini bekledim',
              '“Sakın gelme!” cümlesinde -me olumsuzluk ekidir. “Gelmesini bekledim.” cümlesinde ise isim-fiil ekidir.',
            ],
            [
              'Fiilimsi ile yüklem',
              '“Çocuk koşarak okula geldi.” cümlesinde yüklem geldi sözcüğüdür. Koşarak zarf-fiildir, yüklem değildir.',
            ],
          ]}
        />
      </Section>

      <Section id="lgs" title="LGS’de nasıl sorulur">
        <p>
          Fiilimsi soruları genellikle bir cümledeki sözcüğün türünü ya da görevini sorar. Çoğu zaman ek tanımanı değil, sözcüğün
          cümledeki işine bakmanı ister.
        </p>
        <Question
          number={1}
          stem={
            <>
              Aşağıdaki cümlelerin hangisinde altı çizili sözcük <strong>sıfat-fiildir</strong>?
            </>
          }
          options={[
            <>
              <Hit>Okumak</Hit> insanı geliştirir.
            </>,
            <>
              Çocuk <Hit>gülerek</Hit> yanımıza geldi.
            </>,
            <>
              <Hit>Yırtılmış</Hit> kitabı çöpe attı.
            </>,
            <>
              Dün akşam erken <Hit>uyudum</Hit>.
            </>,
          ]}
          answer={2}
          solution={
            <ol className="list-decimal space-y-1.5 pl-5">
              <li>Her seçenekte altı çizili sözcüğün cümledeki görevini sor.</li>
              <li>A seçeneğinde okumak isim gibi kullanılmış ve özne olmuş. İsim-fiildir.</li>
              <li>B seçeneğinde gülerek, geldi fiilinin nasıl yapıldığını anlatıyor. Zarf-fiildir.</li>
              <li>C seçeneğinde yırtılmış, kitabı sözcüğünü niteliyor. Hangi kitap? Yırtılmış kitap. Sıfat-fiildir.</li>
              <li>D seçeneğinde uyudum çekimli fiildir ve cümlenin yüklemidir.</li>
            </ol>
          }
        />
        <Question
          number={2}
          stem={
            <>
              Aşağıdaki cümlelerin hangisinde <strong>fiilimsi yoktur</strong>?
            </>
          }
          options={[
            'Çocuklar koşa koşa geldi.',
            'Gelecek hafta sınav olacağız.',
            'Kitabı bitirince bana haber ver.',
            'Akşam yemeğini erkenden yedik.',
          ]}
          answer={3}
          solution={
            <ol className="list-decimal space-y-1.5 pl-5">
              <li>Önce her cümlenin yüklemini bul. Sonra yüklem dışındaki fiil kökenli sözcüklere bak.</li>
              <li>A seçeneğinde “koşa koşa” zarf-fiildir.</li>
              <li>B seçeneğinde “gelecek” hafta sözcüğünü niteleyen sıfat-fiildir.</li>
              <li>C seçeneğinde “bitirince” zarf-fiildir.</li>
              <li>D seçeneğinde “yedik” çekimli fiildir. “Erkenden” ise zarftır, fiil kökünden gelmez. Bu cümlede fiilimsi yoktur.</li>
            </ol>
          }
        />
        <Tip>
          <strong>İpucu:</strong> “Fiilimsi yoktur” diyen sorularda önce yüklemi ayır. Geriye kalan sözcüklerde fiil kökünden gelen bir
          sözcük kalmıyorsa cevap odur.
        </Tip>
      </Section>

      <Section id="kendini-dene" title="Kendini dene">
        <p>
          Cevaplara bakmadan önce her soruyu kendi cümlelerinle cevaplamaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı
          öğretir.
        </p>
        <SelfCheck
          items={[
            {
              question: 'Koşmak, koşan ve koşarak sözcüklerinin ortak noktası nedir? Farkları nedir?',
              answer:
                'Üçü de koş- fiilinden türemiş fiilimsidir. Koşmak isim gibi, koşan sıfat gibi ve ismi niteler, koşarak zarf gibi ve fiili niteler.',
            },
            {
              question: '“Gelecek hafta sınava gireceğiz.” cümlesinde hangi sözcük fiilimsidir? Neden?',
              answer: 'Gelecek. Hafta sözcüğünü niteleyen sıfat-fiildir. Gireceğiz çekimli fiildir ve cümlenin yüklemidir.',
            },
            {
              question: '“Dün okuduğum kitabı sana vereyim.” cümlesindeki okuduğum sözcüğünü eklerine ayır.',
              answer: 'oku + duğ + um. -duğ sıfat-fiil ekidir, -um iyelik ekidir. Kişi eki değildir.',
            },
            {
              question: '“Çalışmak başarının anahtarıdır.” cümlesinde çalışmak hangi fiilimsidir? Cümledeki görevi nedir?',
              answer: 'İsim-fiildir. Cümlenin öznesidir.',
            },
            {
              question: '“Sınıfa girer girmez sessizlik oldu.” cümlesinde girer girmez hangi türdür? Neyi niteler?',
              answer: 'Zarf-fiildir. Oldu yüklemini zaman bakımından niteler.',
            },
          ]}
        />
        <p className="text-[15px] text-muted">
          Yanlış yaptığın soruları{' '}
          {role === 'student' ? (
            <Link to="/app/yanlislar" className="font-semibold text-accent hover:underline">
              yanlış soru defterine
            </Link>
          ) : (
            'yanlış soru defterine'
          )}{' '}
          ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
        </p>
      </Section>
    </div>
  )
}
