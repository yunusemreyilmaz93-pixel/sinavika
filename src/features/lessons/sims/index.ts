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
}
