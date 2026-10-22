import { lazy, type ComponentType, type LazyExoticComponent } from 'react'

type Sim = { label: string; Component: LazyExoticComponent<ComponentType> }

export const SIMS: Record<string, Sim> = {
  gaz: {
    label: 'Gaz parçacıkları (basınç, sıcaklık, hacim)',
    Component: lazy(() => import('./gas-sim').then((m) => ({ default: m.GasSim }))),
  },
  mevsim: {
    label: 'Mevsimlerin oluşumu (Dünya’nın yörüngesi)',
    Component: lazy(() => import('./season-sim').then((m) => ({ default: m.SeasonSim }))),
  },
  olasilik: {
    label: 'Olasılık deneyi (para ve zar)',
    Component: lazy(() => import('./probability-sim').then((m) => ({ default: m.ProbabilitySim }))),
  },
  dogru: {
    label: 'Doğrusal denklem grafiği (eğim ve kesim noktaları)',
    Component: lazy(() => import('./line-sim').then((m) => ({ default: m.LineSim }))),
  },
  pisagor: {
    label: 'Pisagor bağıntısı (kenar kareleri)',
    Component: lazy(() => import('./pythagoras-sim').then((m) => ({ default: m.PythagorasSim }))),
  },
  kaldirac: { label: 'Kaldıraç dengesi', Component: lazy(() => import('./lever-sim').then((m) => ({ default: m.LeverSim }))) },
  donusum: {
    label: 'Dönüşüm geometrisi (öteleme, yansıma, dönme)',
    Component: lazy(() => import('./transform-sim').then((m) => ({ default: m.TransformSim }))),
  },
  bolgeler: {
    label: 'Türkiye’nin yedi coğrafi bölgesi (harita)',
    Component: lazy(() => import('./regions-sim').then((m) => ({ default: m.RegionsSim }))),
  },
  koordinat: {
    label: 'Enlem, boylam ve yerel saat (dünya haritası)',
    Component: lazy(() => import('./coordinates-sim').then((m) => ({ default: m.CoordinatesSim }))),
  },
  basinc: {
    label: 'Basınç kuşakları ve sürekli rüzgârlar (enlem şeması)',
    Component: lazy(() => import('./pressure-sim').then((m) => ({ default: m.PressureSim }))),
  },
  olcek: {
    label: 'Ölçek ve gerçek uzaklık',
    Component: lazy(() => import('./scale-sim').then((m) => ({ default: m.ScaleSim }))),
  },
  demografi: {
    label: 'Demografik dönüşüm modeli (beş aşama)',
    Component: lazy(() => import('./demography-sim').then((m) => ({ default: m.DemographySim }))),
  },
  nufus: {
    label: 'Dünya nüfusunun milyar basamakları',
    Component: lazy(() => import('./population-sim').then((m) => ({ default: m.PopulationSim }))),
  },
  sektor: {
    label: 'Çalışan nüfusun sektörlere dağılımı',
    Component: lazy(() => import('./sectors-sim').then((m) => ({ default: m.SectorsSim }))),
  },
  cografyatarihi: {
    label: 'Coğrafya biliminin gelişimi (zaman şeridi)',
    Component: lazy(() => import('./geography-history-sim').then((m) => ({ default: m.GeographyHistorySim }))),
  },
  selcuklu: {
    label: 'Anadolu Selçuklu Devleti (zaman şeridi)',
    Component: lazy(() => import('./history-sims').then((m) => ({ default: m.SeljukSim }))),
  },
  osmanlikurulus: {
    label: 'Osmanlı’nın kuruluşu ve yükselişi 1299 ile 1453 (zaman şeridi)',
    Component: lazy(() => import('./history-sims').then((m) => ({ default: m.OttomanRiseSim }))),
  },
  osmanlidunya: {
    label: 'Osmanlı’nın yükseliş dönemi 1461 ile 1571 (zaman şeridi)',
    Component: lazy(() => import('./history-sims').then((m) => ({ default: m.OttomanPowerSim }))),
  },
  osmanlidegisim: {
    label: 'Osmanlı’da duraklama, gerileme ve ıslahatlar (zaman şeridi)',
    Component: lazy(() => import('./history-sims').then((m) => ({ default: m.OttomanReformSim }))),
  },
  yirminciyuzyil: {
    label: 'II. Meşrutiyet’ten Mondros’a 1908 ile 1918 (zaman şeridi)',
    Component: lazy(() => import('./history-sims').then((m) => ({ default: m.EarlyCenturySim }))),
  },
  kurtulus: {
    label: 'Millî Mücadele haritası ve olay şeridi',
    Component: lazy(() => import('./history-sims').then((m) => ({ default: m.LiberationSim }))),
  },
  inkilaplar: {
    label: 'Atatürk dönemi inkılapları (zaman şeridi)',
    Component: lazy(() => import('./history-sims').then((m) => ({ default: m.ReformsSim }))),
  },
  ilkcagfelsefe: {
    label: 'İlk Çağ filozofları (zaman şeridi)',
    Component: lazy(() => import('./philosophy-sims').then((m) => ({ default: m.AncientPhilosophySim }))),
  },
  ortacagfelsefe: {
    label: 'Orta Çağ düşünürleri (zaman şeridi)',
    Component: lazy(() => import('./philosophy-sims').then((m) => ({ default: m.MedievalPhilosophySim }))),
  },
  ph: { label: 'pH ölçeği ve indikatörler', Component: lazy(() => import('./ph-sim').then((m) => ({ default: m.PhSim }))) },
  parabol: {
    label: 'Parabol (a, b, c katsayıları, kökler ve tepe noktası)',
    Component: lazy(() => import('./parabola-sim').then((m) => ({ default: m.ParabolaSim }))),
  },
  mutlak: {
    label: 'Mutlak değer ve sayı doğrusu (uzaklık, çözüm aralığı)',
    Component: lazy(() => import('./absolute-sim').then((m) => ({ default: m.AbsoluteSim }))),
  },
  hareket: {
    label: 'İki aracın hareketi (yol zaman grafiği)',
    Component: lazy(() => import('./motion-sim').then((m) => ({ default: m.MotionSim }))),
  },
  benzerlik: {
    label: 'Benzer üçgenler (benzerlik oranı, çevre ve alan)',
    Component: lazy(() => import('./similarity-sim').then((m) => ({ default: m.SimilaritySim }))),
  },
  cember: {
    label: 'Merkez açı ve çevre açı',
    Component: lazy(() => import('./circle-sim').then((m) => ({ default: m.CircleSim }))),
  },
  kombinasyon: {
    label: 'Permütasyon ve kombinasyon (seçimlerin listesi)',
    Component: lazy(() => import('./combinatorics-sim').then((m) => ({ default: m.CombinatoricsSim }))),
  },
  istatistik: {
    label: 'Veri, ortalama, ortanca ve tepe değer',
    Component: lazy(() => import('./statistics-sim').then((m) => ({ default: m.StatisticsSim }))),
  },
  karisim: {
    label: 'Karışım problemi (miktar ve yoğunluk)',
    Component: lazy(() => import('./mixture-sim').then((m) => ({ default: m.MixtureSim }))),
  },
  fonksiyon: {
    label: 'Fonksiyon makinesi ve bileşke',
    Component: lazy(() => import('./function-sim').then((m) => ({ default: m.FunctionSim }))),
  },
  venn: {
    label: 'İki kümenin birleşimi (Venn şeması)',
    Component: lazy(() => import('./venn-sim').then((m) => ({ default: m.VennSim }))),
  },
  ebob: {
    label: 'EBOB ve EKOK (zemin döşeme)',
    Component: lazy(() => import('./gcd-sim').then((m) => ({ default: m.GcdSim }))),
  },
  ucgenaci: {
    label: 'Üçgenin iç ve dış açıları',
    Component: lazy(() => import('./triangle-angles-sim').then((m) => ({ default: m.TriangleAnglesSim }))),
  },
  oranti: {
    label: 'Doğru ve ters orantı',
    Component: lazy(() => import('./proportion-sim').then((m) => ({ default: m.ProportionSim }))),
  },
  ivme: {
    label: 'Hız-zaman grafiği (ilk hız, ivme ve yer değiştirme)',
    Component: lazy(() => import('./kinematics-sim').then((m) => ({ default: m.KinematicsSim }))),
  },
  enerji: {
    label: 'Enerji dönüşümü (potansiyel, kinetik, sürtünme)',
    Component: lazy(() => import('./energy-sim').then((m) => ({ default: m.EnergySim }))),
  },
  hal: {
    label: 'Hal değişimi grafiği (buzdan buhara)',
    Component: lazy(() => import('./phase-sim').then((m) => ({ default: m.PhaseSim }))),
  },
  coulomb: {
    label: 'Coulomb kuvveti (yükler ve uzaklık)',
    Component: lazy(() => import('./coulomb-sim').then((m) => ({ default: m.CoulombSim }))),
  },
  devre: {
    label: 'Seri ve paralel devre (akım, gerilim, direnç)',
    Component: lazy(() => import('./circuit-sim').then((m) => ({ default: m.CircuitSim }))),
  },
  kaldirma: {
    label: 'Kaldırma kuvveti (yüzme ve batma)',
    Component: lazy(() => import('./buoyancy-sim').then((m) => ({ default: m.BuoyancySim }))),
  },
  dalga: {
    label: 'Dalga özellikleri (genlik, dalga boyu, frekans)',
    Component: lazy(() => import('./wave-sim').then((m) => ({ default: m.WaveSim }))),
  },
  mercek: {
    label: 'İnce kenarlı mercekte görüntü oluşumu',
    Component: lazy(() => import('./lens-sim').then((m) => ({ default: m.LensSim }))),
  },
  atom: {
    label: 'Atomun elektron dizilimi (katmanlar, periyot ve grup)',
    Component: lazy(() => import('./atom-sim').then((m) => ({ default: m.AtomSim }))),
  },
  mol: {
    label: 'Mol hesabı (kütle, tanecik sayısı, gaz hacmi)',
    Component: lazy(() => import('./mole-sim').then((m) => ({ default: m.MoleSim }))),
  },
  tepkime: {
    label: 'Sınırlayıcı bileşen (tepkime ve artan madde)',
    Component: lazy(() => import('./reaction-sim').then((m) => ({ default: m.ReactionSim }))),
  },
  punnett: {
    label: 'Punnett karesi (monohibrit çaprazlama)',
    Component: lazy(() => import('./punnett-sim').then((m) => ({ default: m.PunnettSim }))),
  },
  osmoz: {
    label: 'Osmoz (hipotonik, izotonik, hipertonik ortam)',
    Component: lazy(() => import('./osmosis-sim').then((m) => ({ default: m.OsmosisSim }))),
  },
  piramit: {
    label: 'Enerji piramidi (basamaklar arası enerji aktarımı)',
    Component: lazy(() => import('./energy-pyramid-sim').then((m) => ({ default: m.EnergyPyramidSim }))),
  },
}
