// Herkese açık LGS ve YKS puan hesaplama sayfaları. Katsayılar src/lib/score.ts dosyasından gelir
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

export const scoreCss = `<style>
.pub .notice{margin-top:1.25rem;padding:.9rem 1rem;border:1px solid color-mix(in srgb,var(--warning) 40%,transparent);border-radius:1rem;background:var(--warning-soft);font-size:.95rem}
.pub .notice b{display:block;margin-bottom:.15rem}
.pub .group-title{display:flex;align-items:baseline;justify-content:space-between;gap:.5rem;margin:1.5rem 0 .25rem;padding-bottom:.4rem;border-bottom:2px solid var(--line);font-size:1.05rem}
.pub .group-title:first-child{margin-top:0}
.pub .group-title small{color:var(--fg-muted);font-size:.8rem;font-weight:600}
.pub .results{display:grid;grid-template-columns:repeat(auto-fit,minmax(7rem,1fr));gap:.6rem;margin-top:1.25rem}
@media(max-width:40rem){.pub .results .result:first-child:nth-last-child(5){grid-column:1/-1}}
.pub .result{padding:.8rem .9rem;border-radius:.9rem;background:var(--surface-2)}
.pub .result span{display:block;color:var(--fg-muted);font-size:.85rem}
.pub .result strong{display:block;font-family:'Bricolage Grotesque Variable',sans-serif;font-size:1.7rem;line-height:1.2}
.pub .result small{display:block;color:var(--fg-muted);font-size:.8rem}
.pub .diploma{display:grid;grid-template-columns:minmax(0,1fr) 6rem;gap:.5rem;align-items:center;padding:.75rem 0;border-bottom:1px solid var(--line)}
.pub .diploma input{width:100%;min-height:2.75rem;padding:0 .5rem;border:1px solid var(--line-strong);border-radius:.6rem;background:var(--bg);color:var(--fg);font:inherit;text-align:center}
</style>`

const section = (id, rows) =>
  rows
    .map(
      ([key, name, count]) =>
        `<div class="calc-row" data-row="${id}:${key}" data-max="${count}"><div class="calc-name"><b>${name}</b><span>${count} soru</span></div><label>Doğru<input inputmode="numeric" pattern="[0-9]*" maxlength="3" data-k="d" autocomplete="off"></label><label>Yanlış<input inputmode="numeric" pattern="[0-9]*" maxlength="3" data-k="y" autocomplete="off"></label><div class="calc-cell"><span>Boş</span><output class="blank" data-b>${count}</output></div><div class="calc-cell"><span>Net</span><output data-net>0</output></div></div>`,
    )
    .join('')

const result = (key, label) => `<div class="result"><span>${label}</span><strong data-out="${key}">-</strong><small data-place="${key}"></small></div>`

export function lgsBody() {
  return `<section class="calc" id="puan" aria-label="LGS puan hesaplama aracı">
${section('lgs', LGS)}
<div class="results">${result('lgs', 'LGS puanı')}</div>
<p class="calc-note" data-note></p>
</section>`
}

export function yksBody() {
  return `<section class="calc" id="puan" aria-label="YKS puan hesaplama aracı">
<h2 class="group-title">TYT <small>Temel Yeterlilik Testi</small></h2>${section('tyt', TYT)}
<h2 class="group-title">AYT <small>Alan Yeterlilik Testleri</small></h2>${section('ayt', AYT)}
<h2 class="group-title">YDT <small>Yabancı Dil Testi</small></h2>${section('ydt', YDT)}
<div class="diploma"><label for="diploma"><b>Diploma notu</b><span class="muted"> 50 ile 100 arası, isteğe bağlı</span></label><input id="diploma" inputmode="decimal" maxlength="5" data-diploma autocomplete="off" placeholder="85"></div>
<div class="results">${result('tyt', 'TYT puanı')}${['SAY', 'EA', 'SÖZ', 'DİL'].map((t) => result(t, `${t} puanı`)).join('')}</div>
<p class="calc-note" data-note></p>
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
note.textContent=r.bad?'Doğru ve yanlış toplamı soru sayısını aşmamalı':''}
root.addEventListener('input',function(e){var t=e.target;if(t.dataset.k)t.value=t.value.replace(/[^0-9]/g,'');calc()});calc()})()`
