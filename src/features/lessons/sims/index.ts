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
}
