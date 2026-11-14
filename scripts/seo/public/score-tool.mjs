// Herkese açık puan hesaplama sayfası. Katsayılar src/lib/score.ts dosyasından gelir
export const SCORE = '/araclar/puan-hesaplama'

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
.pub .tabs{display:flex;gap:.25rem;flex-wrap:wrap;margin-top:0;padding:.25rem;border-radius:.9rem;background:var(--surface-2)}
.pub .tabs button{flex:1;min-width:4.5rem;min-height:2.75rem;border:0;border-radius:.7rem;background:transparent;color:var(--fg-muted);font:inherit;font-weight:700;cursor:pointer}
.pub .tabs button[aria-selected=true]{background:var(--surface);color:var(--fg);box-shadow:0 1px 2px rgb(0 0 0/.08)}
.pub .panel[hidden]{display:none}
.pub .group-title{margin:1.25rem 0 0;font-size:1rem}
.pub .results{display:grid;grid-template-columns:repeat(auto-fill,minmax(8rem,1fr));gap:.6rem;margin-top:1.25rem}
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
        `<div class="calc-row" data-row="${id}:${key}" data-max="${count}"><div class="calc-name"><b>${name}</b><span>${count} soru</span></div><label>Doğru<input inputmode="numeric" pattern="[0-9]*" maxlength="3" data-k="d" autocomplete="off"></label><label>Yanlış<input inputmode="numeric" pattern="[0-9]*" maxlength="3" data-k="y" autocomplete="off"></label><output>0</output></div>`,
    )
    .join('')

export function scoreBody() {
  return `<section class="calc" id="puan" aria-label="Puan hesaplama aracı">
<div class="tabs" role="tablist" aria-label="Sınav">
<button type="button" role="tab" aria-selected="true" data-tab="lgs">LGS</button><button type="button" role="tab" aria-selected="false" data-tab="tyt">TYT</button><button type="button" role="tab" aria-selected="false" data-tab="ayt">AYT ve YDT</button>
</div>
<div class="panel" data-panel="lgs">${section('lgs', LGS)}<div class="results"><div class="result"><span>LGS puanı</span><strong data-out="lgs">-</strong></div></div></div>
<div class="panel" data-panel="tyt" hidden>${section('tyt', TYT)}<div class="results"><div class="result"><span>TYT puanı</span><strong data-out="tyt">-</strong></div></div></div>
<div class="panel" data-panel="ayt" hidden>
<p class="calc-note">Yerleştirme puanında TYT de sayılır. TYT netlerinizi TYT sekmesine girin, burada kullanılır.</p>
<h2 class="group-title">AYT</h2>${section('ayt', AYT)}
<h2 class="group-title">YDT</h2>${section('ydt', YDT)}
<div class="diploma"><label for="diploma"><b>Diploma notu</b><span class="muted"> 50 ile 100 arası, isteğe bağlı</span></label><input id="diploma" inputmode="decimal" maxlength="5" data-diploma autocomplete="off" placeholder="85"></div>
<div class="results">${['SAY', 'EA', 'SÖZ', 'DİL'].map((t) => `<div class="result"><span>${t} puanı</span><strong data-out="${t}">-</strong><small data-place="${t}"></small></div>`).join('')}</div>
</div>
<p class="calc-note" data-note></p>
</section>`
}

export const scoreScript = (formulas) => `(function(){var F=${JSON.stringify(formulas).replace(/</g, '\\u003c')};var root=document.getElementById('puan');if(!root)return;var note=root.querySelector('[data-note]');
function fmt(n){return n.toFixed(2).replace('.',',')}
function nets(){var out={},bad=false;root.querySelectorAll('[data-row]').forEach(function(r){var d=parseInt(r.querySelector('[data-k=d]').value,10)||0,y=parseInt(r.querySelector('[data-k=y]').value,10)||0,max=+r.dataset.max,key=r.dataset.row,div=key.indexOf('lgs:')===0?3:4,o=r.querySelector('output');if(d+y>max){bad=true;o.textContent='-';o.classList.add('bad');return}o.classList.remove('bad');var n=d-y/div;o.textContent=fmt(n).replace(',00','');out[key.split(':')[1]]=n});return{n:out,bad:bad}}
function set(k,v){root.querySelector('[data-out="'+k+'"]').textContent=v==null?'-':fmt(v)}
function calc(){var r=nets(),n=r.n;
var w=0;Object.keys(F.lgs.weights).forEach(function(k){w+=Math.max(0,n[k]||0)*F.lgs.weights[k]});var anyL=Object.keys(F.lgs.weights).some(function(k){return n[k]});set('lgs',anyL?F.lgs.base+w*F.lgs.factor:null);
var t={tr:n.tr||0,sos:n.sos||0,mat:n.mat||0,fen:n.fen||0},valid=t.tr>=.5||t.mat>=.5;
set('tyt',valid?F.tyt.base+t.tr*F.tyt.tyt.tr+t.sos*F.tyt.tyt.sos+t.mat*F.tyt.tyt.mat+t.fen*F.tyt.tyt.fen:null);
var dip=parseFloat((root.querySelector('[data-diploma]').value||'').replace(',','.')),obp=dip>=50&&dip<=100?dip*.6:0;
Object.keys(F.yks).forEach(function(type){var f=F.yks[type],has=Object.keys(f.ayt).some(function(k){return(n[k]||0)>=.5}),p=root.querySelector('[data-place="'+type+'"]');if(!has){set(type,null);p.textContent='';return}var a=0;Object.keys(f.ayt).forEach(function(k){a+=(n[k]||0)*f.ayt[k]});var raw=valid?f.base+t.tr*f.tyt.tr+t.sos*f.tyt.sos+t.mat*f.tyt.mat+t.fen*f.tyt.fen+a:100;set(type,raw);p.textContent=obp?'Yerleştirme: '+fmt(raw+obp):'Ham puan'});
note.textContent=r.bad?'Doğru ve yanlış toplamı soru sayısını aşmamalı':''}
root.querySelectorAll('[data-tab]').forEach(function(b){b.addEventListener('click',function(){root.querySelectorAll('[data-tab]').forEach(function(x){x.setAttribute('aria-selected',String(x===b))});root.querySelectorAll('[data-panel]').forEach(function(p){p.hidden=p.dataset.panel!==b.dataset.tab})})});
root.addEventListener('input',function(e){var t=e.target;if(t.dataset.k)t.value=t.value.replace(/[^0-9]/g,'');calc()});calc()})()`
