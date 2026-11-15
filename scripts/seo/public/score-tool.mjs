// Herkese açık LGS ve YKS puan hesaplama sayfaları. Katsayılar src/lib/score.ts dosyasından gelir
import { codeChip, hueColor, icon } from './layout.mjs'

export const LGS_SCORE = '/araclar/lgs-puan-hesaplama'
export const YKS_SCORE = '/araclar/yks-puan-hesaplama'

// [kimlik, ad, soru sayısı]
const LGS = [
  ['lgs-tr', 'Türkçe', 20],
  ['lgs-mat', 'Matematik', 20],
  ['lgs-fen', 'Fen Bilimleri', 20],
  ['lgs-ink', 'T.C. İnkılap Tarihi ve Atatürkçülük', 10],
  ['lgs-din', 'Din Kültürü ve Ahlak Bilgisi', 10],
  ['lgs-ing', 'Yabancı Dil', 10],
]
const TYT = [
  ['tr', 'Türkçe', 40],
  ['sos', 'Sosyal Bilimler', 20],
  ['mat', 'Temel Matematik', 40],
  ['fen', 'Fen Bilimleri', 20],
]
const AYT = [
  ['ayt-mat', 'Matematik', 40],
  ['ayt-fiz', 'Fizik', 14],
  ['ayt-kim', 'Kimya', 13],
  ['ayt-bio', 'Biyoloji', 13],
  ['ayt-edb', 'Türk Dili ve Edebiyatı', 24],
  ['ayt-tar1', 'Tarih-1', 10],
  ['ayt-cog1', 'Coğrafya-1', 6],
  ['ayt-tar2', 'Tarih-2', 11],
  ['ayt-cog2', 'Coğrafya-2', 11],
  ['ayt-fel', 'Felsefe Grubu', 12],
  ['ayt-din', 'Din Kültürü ve Ahlak Bilgisi', 6],
]
const YDT = [['ydt-dil', 'Yabancı Dil', 80]]

// Ders koduna göre ikon ve renk, uygulamadaki ders paletiyle aynı
const look = { tr: ['tr', 'coral'], mat: ['mat', 'sea'], fen: ['fen', 'pine'], ink: ['ink', 'amber'], din: ['din', 'teal'], ing: ['ing', 'violet'], sos: ['tar', 'amber'], fiz: ['fiz', 'pine'], kim: ['kim', 'teal'], bio: ['bio', 'lime'], edb: ['edb', 'coral'], tar1: ['tar', 'amber'], tar2: ['tar', 'amber'], cog1: ['cog', 'orange'], cog2: ['cog', 'orange'], fel: ['fel', 'violet'], dil: ['dil', 'violet'] }
const lookOf = (key) => look[key.split('-').at(-1)] ?? ['x', 'slate']

// Net ve puan araçlarının ortak stili
export const toolRowCss = `
.pub .tool{display:grid;gap:1.25rem;margin-top:1.5rem}
@media(min-width:64rem){.pub .tool{grid-template-columns:minmax(0,1fr) 20rem;align-items:start}.pub .tool-side{position:sticky;top:5rem}}
.pub .tool-side{display:grid;gap:.75rem}
@media(max-width:63.99rem){.pub .tool-side{display:contents}}
.pub .seg{display:flex;gap:.25rem;padding:.25rem;border-radius:.9rem;background:var(--surface-2);overflow-x:auto;scrollbar-width:none}
.pub .seg button,.pub .seg a{flex:1;min-height:2.75rem;padding:0 1rem;border:0;border-radius:.7rem;background:transparent;color:var(--fg-muted);font:inherit;font-weight:700;cursor:pointer;text-decoration:none;display:grid;place-items:center;white-space:nowrap}
.pub .seg a:hover{color:var(--fg)}
.pub .seg [aria-pressed=true]{background:var(--surface);color:var(--fg);box-shadow:0 1px 2px rgb(0 0 0 / .08)}
.pub .group-title{display:flex;align-items:baseline;justify-content:space-between;gap:.5rem;margin:1.75rem 0 .6rem;font-size:1.15rem;scroll-margin-top:5rem}
.pub .group-title:first-child{margin-top:0}
.pub .group-title small{color:var(--fg-muted);font-size:.85rem;font-weight:600;font-family:'Figtree Variable',sans-serif}
.pub .trows{display:grid;gap:.5rem}
.pub .trow{display:grid;grid-template-columns:minmax(0,1fr) 5rem 5rem 3rem 4.75rem;gap:.6rem;align-items:center;padding:.7rem .8rem;border:1px solid var(--line);border-radius:1.25rem;background:var(--surface)}
.pub .tname{display:flex;align-items:center;gap:.7rem;min-width:0}
.pub .tname b{display:block;line-height:1.3;font-size:.95rem}
.pub .tname small{display:block;color:var(--fg-muted);font-size:.8rem}
.pub .trow label,.pub .trow .tb{display:grid;gap:.15rem;font-size:.75rem;color:var(--fg-muted);font-weight:600;text-align:center}
.pub .trow input{width:100%;min-height:2.75rem;padding:0 .4rem;border:1px solid var(--line-strong);border-radius:.75rem;background:var(--bg);color:var(--fg);font:inherit;font-weight:700;font-size:1.05rem;text-align:center;font-variant-numeric:tabular-nums}
.pub .trow input:focus{outline:2px solid var(--primary);outline-offset:-1px;border-color:transparent}
.pub .trow .tb output{min-height:2.75rem;display:grid;place-items:center;font-weight:700;font-size:1.05rem;color:var(--fg-muted)}
.pub .tnet{display:grid;place-items:center;align-content:center;min-height:3.4rem;border-radius:.9rem;background:color-mix(in srgb,var(--c) 12%,transparent);color:color-mix(in srgb,var(--c) 50%,var(--fg))}
.pub .tnet span{font-size:.72rem;font-weight:700}
.pub .tnet output{font-family:'Bricolage Grotesque Variable',sans-serif;font-weight:800;font-size:1.2rem;line-height:1.1;font-variant-numeric:tabular-nums}
.pub output.bad{color:var(--danger)}
@media(max-width:35.99rem){.pub .trow{grid-template-columns:1fr 1fr 2.75rem 4.25rem;gap:.5rem}.pub .tname{grid-column:1/-1}}
.pub .best{padding:1.25rem;border-radius:1.5rem;background:var(--primary);color:var(--primary-fg)}
.pub .best span{display:block;font-size:.9rem;opacity:.9}
.pub .best strong{display:block;font-family:'Bricolage Grotesque Variable',sans-serif;font-size:2.75rem;line-height:1.1;font-variant-numeric:tabular-nums}
.pub .best small{display:block;font-size:.85rem;opacity:.9;margin-top:.15rem}
@media(max-width:63.99rem){.pub .best{position:sticky;bottom:.75rem;z-index:5;display:flex;align-items:baseline;justify-content:space-between;gap:.25rem .75rem;flex-wrap:wrap;padding:.8rem 1.1rem;box-shadow:0 8px 24px rgb(0 0 0 / .18)}.pub .best strong{font-size:1.75rem}.pub .best small{flex-basis:100%;margin:0}}
.pub .calc-note{margin:.25rem 0 0;color:var(--fg-muted);font-size:.9rem}
.pub .calc-note:empty{display:none}
.pub .calc-note.warn{color:var(--danger);font-weight:600}
`

export const scoreCss = `<style>${toolRowCss}
.pub .notice{padding:.9rem 1rem;border:1px solid color-mix(in srgb,var(--warning) 40%,transparent);border-radius:1.25rem;background:var(--warning-soft);font-size:.9rem}
.pub .notice b{display:block;margin-bottom:.15rem;color:var(--warning)}
.pub .results{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:.6rem}
.pub .result{padding:.8rem .9rem;border:1px solid var(--line);border-radius:1.25rem;background:var(--surface)}
.pub .result span{display:flex;align-items:center;gap:.35rem;color:var(--fg-muted);font-size:.82rem;font-weight:700}
.pub .result span i{width:.5rem;height:.5rem;border-radius:999px}
.pub .result strong{display:block;font-family:'Bricolage Grotesque Variable',sans-serif;font-size:1.45rem;line-height:1.25;font-variant-numeric:tabular-nums}
.pub .result small{display:block;color:var(--fg-muted);font-size:.78rem;min-height:1.1em}
.pub .diploma{display:grid;grid-template-columns:minmax(0,1fr) 6rem;gap:.75rem;align-items:center;padding:.8rem;border:1px solid var(--line);border-radius:1.25rem;background:var(--surface);scroll-margin-top:5rem}
.pub .diploma .tname{gap:.7rem}
.pub .diploma input{width:100%;min-height:2.75rem;padding:0 .5rem;border:1px solid var(--line-strong);border-radius:.75rem;background:var(--bg);color:var(--fg);font:inherit;font-weight:700;text-align:center}
.pub .minis{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:.6rem}
.pub .mini{display:grid;gap:.2rem;padding:.8rem .9rem;border-radius:1rem;font-size:.85rem;color:var(--fg-muted)}
.pub .mini b{font-family:'Bricolage Grotesque Variable',sans-serif;font-size:1rem}
.pub .mini code{font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-size:.85rem;color:var(--fg)}
.pub .mini mark{background:var(--marker);color:var(--marker-fg);padding:0 .2em;border-radius:.2em}
.pub .infos{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:.6rem}
.pub .infos .rc{padding:1rem}
.pub .infos .ic{font-size:.72rem;font-weight:800;width:auto;padding:0 .5rem}
.pub .infos b{display:block;margin-top:.7rem;font-size:.95rem;color:var(--fg)}
.pub .infos small{display:block;color:var(--fg-muted);font-size:.82rem}
.pub .side-link{display:flex;align-items:center;gap:.75rem;padding:.8rem .9rem;border:1px solid var(--line);border-radius:1.25rem;background:var(--surface);color:var(--fg);text-decoration:none;font-size:.9rem}
.pub .side-link b{display:block}
.pub .side-link small{color:var(--fg-muted)}
.pub .side-link>svg:last-child{margin-left:auto;width:1.1rem;height:1.1rem;color:var(--fg-muted)}
</style>`

export const rowHtml = (id, [key, name, count]) => {
  const [code, hue] = lookOf(key)
  return `<div class="trow" data-row="${id}:${key}" data-max="${count}" style="--c:${hueColor(hue)}"><div class="tname">${codeChip(code, hue)}<span><b>${name}</b><small>${count} soru</small></span></div><label>Doğru<input inputmode="numeric" pattern="[0-9]*" maxlength="3" data-k="d" autocomplete="off" aria-label="${name} doğru"></label><label>Yanlış<input inputmode="numeric" pattern="[0-9]*" maxlength="3" data-k="y" autocomplete="off" aria-label="${name} yanlış"></label><div class="tb"><span>Boş</span><output class="blank" data-b>${count}</output></div><div class="tnet"><span>Net</span><output data-net>0</output></div></div>`
}
const section = (id, rows) => `<div class="trows">${rows.map((r) => rowHtml(id, r)).join('')}</div>`

const result = (key, label, hue) => `<div class="result"><span><i style="background:${hueColor(hue)}"></i>${label}</span><strong data-out="${key}">-</strong><small data-place="${key}"></small></div>`
const notice = (text) => `<div class="notice"><b>Bilgi amaçlıdır</b>${text}</div>`

export function lgsBody(noticeText = '') {
  return `<section class="tool" id="puan" aria-label="LGS puan hesaplama aracı">
<div>${section('lgs', LGS)}<p class="calc-note warn" data-note></p></div>
<aside class="tool-side"><div class="best" aria-live="polite"><span>LGS puanı</span><strong data-out="lgs">-</strong><small>500 puan üzerinden</small></div>${notice(noticeText)}
<a class="side-link" href="/araclar/net-hesaplama">${codeChip('mat', 'amber')}<span><b>Netlerinizi tek tek görün</b><small>Net hesaplama</small></span>${icon('ArrowRight')}</a></aside>
</section>`
}

const AYT_SAY = AYT.filter(([k]) => ['ayt-mat', 'ayt-fiz', 'ayt-kim', 'ayt-bio'].includes(k))
const AYT_SOZ = AYT.filter((r) => !AYT_SAY.includes(r))

export function yksBody(noticeText = '') {
  return `<nav class="seg" aria-label="Bölümler" style="margin-top:1.5rem"><a href="#tyt">TYT</a><a href="#ayt">AYT</a><a href="#ydt">YDT</a><a href="#diploma-alan">Diploma</a></nav>
<section class="tool" id="puan" aria-label="YKS puan hesaplama aracı">
<div>
<h2 class="group-title" id="tyt">TYT <small>Temel Yeterlilik Testi, 120 soru</small></h2>${section('tyt', TYT)}
<h2 class="group-title" id="ayt">AYT <small>Matematik ve fen</small></h2>${section('ayt', AYT_SAY)}
<h2 class="group-title">AYT <small>Edebiyat ve sosyal bilimler</small></h2>${section('ayt', AYT_SOZ)}
<h2 class="group-title" id="ydt">YDT <small>Yabancı Dil Testi, 80 soru</small></h2>${section('ydt', YDT)}
<h2 class="group-title" id="diploma-alan">Diploma notu <small>İsteğe bağlı</small></h2>
<div class="diploma"><label class="tname" for="diploma">${codeChip('edb', 'amber')}<span><b>Diploma notu</b><small>50 ile 100 arası, 0,6 katı eklenir</small></span></label><input id="diploma" inputmode="decimal" maxlength="5" data-diploma autocomplete="off" placeholder="85"></div>
<p class="calc-note warn" data-note></p>
</div>
<aside class="tool-side"><div class="best" aria-live="polite"><span data-best-label>Puanınız</span><strong data-best>-</strong><small data-best-note>Netlerinizi girin</small></div>
<div class="results">${result('tyt', 'TYT', 'coral')}${result('SAY', 'SAY', 'sea')}${result('EA', 'EA', 'violet')}${result('SÖZ', 'SÖZ', 'amber')}${result('DİL', 'DİL', 'teal')}</div>
${notice(noticeText)}
<a class="side-link" href="/yks-bolumleri">${codeChip('fel', 'violet')}<span><b>Bu puanla hangi bölümler?</b><small>YKS bölümlerinde karşılaştırın</small></span>${icon('ArrowRight')}</a></aside>
</section>`
}

// İki sayfa da aynı betiği kullanır, sayfada olmayan alanlar atlanır
export const scoreScript = (formulas) => `(function(){var F=${JSON.stringify(formulas).replace(/</g, '\\u003c')};var root=document.getElementById('puan');if(!root)return;var note=root.querySelector('[data-note]'),dipEl=root.querySelector('[data-diploma]');
function fmt(n){return n.toFixed(2).replace('.',',')}
function nets(){var out={},bad=false;root.querySelectorAll('[data-row]').forEach(function(r){var d=parseInt(r.querySelector('[data-k=d]').value,10)||0,y=parseInt(r.querySelector('[data-k=y]').value,10)||0,max=+r.dataset.max,key=r.dataset.row,div=key.indexOf('lgs:')===0?3:4,o=r.querySelector('[data-net]'),b=r.querySelector('[data-b]');if(d+y>max){bad=true;o.textContent='-';b.textContent='-';o.classList.add('bad');return}o.classList.remove('bad');b.textContent=String(max-d-y);var n=d-y/div;o.textContent=fmt(n).replace(',00','');out[key.split(':')[1]]=n});return{n:out,bad:bad}}
function set(k,v,place){var o=root.querySelector('[data-out="'+k+'"]');if(!o)return;o.textContent=v==null?'-':fmt(v);var p=root.querySelector('[data-place="'+k+'"]');if(p)p.textContent=v==null?'':place||''}
function calc(){var r=nets(),n=r.n;
var w=0;Object.keys(F.lgs.weights).forEach(function(k){w+=Math.max(0,n[k]||0)*F.lgs.weights[k]});var anyL=Object.keys(F.lgs.weights).some(function(k){return n[k]});set('lgs',anyL?F.lgs.base+w*F.lgs.factor:null);
var t={tr:n.tr||0,sos:n.sos||0,mat:n.mat||0,fen:n.fen||0},valid=t.tr>=.5||t.mat>=.5;
var dip=dipEl?parseFloat((dipEl.value||'').replace(',','.')):NaN,obp=dip>=50&&dip<=100?dip*.6:0;
function place(raw){return obp?'OBP ile '+fmt(raw+obp):'Ham puan'}
var tyt=valid?F.tyt.base+t.tr*F.tyt.tyt.tr+t.sos*F.tyt.tyt.sos+t.mat*F.tyt.tyt.mat+t.fen*F.tyt.tyt.fen:null;set('tyt',tyt,tyt==null?'':place(tyt));
Object.keys(F.yks).forEach(function(type){var f=F.yks[type],has=Object.keys(f.ayt).some(function(k){return(n[k]||0)>=.5});if(!has){set(type,null);return}var a=0;Object.keys(f.ayt).forEach(function(k){a+=(n[k]||0)*f.ayt[k]});var raw=valid?f.base+t.tr*f.tyt.tr+t.sos*f.tyt.sos+t.mat*f.tyt.mat+t.fen*f.tyt.fen+a:100;set(type,raw,place(raw))});
var bl=root.querySelector('[data-best]');if(bl){var best=null;function pick(keys){keys.forEach(function(k){var o=root.querySelector('[data-out="'+k+'"]');var v=o&&o.textContent!=='-'?parseFloat(o.textContent.replace(',','.')):null;if(v!=null&&(!best||v>best.v))best={k:k,v:v}})}pick(['SAY','EA','SÖZ','DİL']);if(!best)pick(['tyt']);var pl=best&&root.querySelector('[data-place="'+best.k+'"]');bl.textContent=best?fmt(best.v):'-';root.querySelector('[data-best-label]').textContent=best?(best.k==='tyt'?'TYT':best.k)+' puanı':'Puanınız';root.querySelector('[data-best-note]').textContent=best?(pl&&pl.textContent?pl.textContent:'Ham puan'):'Netlerinizi girin'}
note.textContent=r.bad?'Doğru ve yanlış toplamı soru sayısını aşmamalı':''}
root.addEventListener('input',function(e){var t=e.target;if(t.dataset.k)t.value=t.value.replace(/[^0-9]/g,'');calc()});calc()})()`
