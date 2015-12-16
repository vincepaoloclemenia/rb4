function LightenDarkenColor(t,e){var n=!1;"#"===t[0]&&(t=t.slice(1),n=!0);var o=parseInt(t,16),i=(o>>16)+e;i>255?i=255:0>i&&(i=0);var r=(o>>8&255)+e;r>255?r=255:0>r&&(r=0);var s=(255&o)+e;return s>255?s=255:0>s&&(s=0),(n?"#":"")+(s|r<<8|i<<16).toString(16)}if(window.Modernizr=function(t,e,n){function o(t){y.cssText=t}function i(t,e){return typeof t===e}function r(t,e){return!!~(""+t).indexOf(e)}function s(t,e){for(var o in t){var i=t[o];if(!r(i,"-")&&y[i]!==n)return"pfx"==e?i:!0}return!1}function a(t,e,o){for(var r in t){var s=e[t[r]];if(s!==n)return o===!1?t[r]:i(s,"function")?s.bind(o||e):s}return!1}function l(t,e,n){var o=t.charAt(0).toUpperCase()+t.slice(1),r=(t+" "+x.join(o+" ")+o).split(" ");return i(e,"string")||i(e,"undefined")?s(r,e):(r=(t+" "+A.join(o+" ")+o).split(" "),a(r,e,n))}var c,u,d,f="2.8.3",p={},h=!0,g=e.documentElement,m="modernizr",v=e.createElement(m),y=v.style,b=({}.toString," -webkit- -moz- -o- -ms- ".split(" ")),w="Webkit Moz O ms",x=w.split(" "),A=w.toLowerCase().split(" "),T={svg:"http://www.w3.org/2000/svg"},C={},E=[],k=E.slice,S=function(t,n,o,i){var r,s,a,l,c=e.createElement("div"),u=e.body,d=u||e.createElement("body");if(parseInt(o,10))for(;o--;)a=e.createElement("div"),a.id=i?i[o]:m+(o+1),c.appendChild(a);return r=["&#173;",'<style id="s',m,'">',t,"</style>"].join(""),c.id=m,(u?c:d).innerHTML+=r,d.appendChild(c),u||(d.style.background="",d.style.overflow="hidden",l=g.style.overflow,g.style.overflow="hidden",g.appendChild(d)),s=n(c,t),u?c.parentNode.removeChild(c):(d.parentNode.removeChild(d),g.style.overflow=l),!!s},D={}.hasOwnProperty;d=i(D,"undefined")||i(D.call,"undefined")?function(t,e){return e in t&&i(t.constructor.prototype[e],"undefined")}:function(t,e){return D.call(t,e)},Function.prototype.bind||(Function.prototype.bind=function(t){var e=this;if("function"!=typeof e)throw new TypeError;var n=k.call(arguments,1),o=function(){if(this instanceof o){var i=function(){};i.prototype=e.prototype;var r=new i,s=e.apply(r,n.concat(k.call(arguments)));return Object(s)===s?s:r}return e.apply(t,n.concat(k.call(arguments)))};return o}),C.touch=function(){var n;return"ontouchstart"in t||t.DocumentTouch&&e instanceof DocumentTouch?n=!0:S(["@media (",b.join("touch-enabled),("),m,")","{#modernizr{top:9px;position:absolute}}"].join(""),function(t){n=9===t.offsetTop}),n},C.csstransforms=function(){return!!l("transform")},C.csstransforms3d=function(){var t=!!l("perspective");return t&&"webkitPerspective"in g.style&&S("@media (transform-3d),(-webkit-transform-3d){#modernizr{left:9px;position:absolute;height:3px;}}",function(e,n){t=9===e.offsetLeft&&3===e.offsetHeight}),t},C.svg=function(){return!!e.createElementNS&&!!e.createElementNS(T.svg,"svg").createSVGRect};for(var N in C)d(C,N)&&(u=N.toLowerCase(),p[u]=C[N](),E.push((p[u]?"":"no-")+u));return p.addTest=function(t,e){if("object"==typeof t)for(var o in t)d(t,o)&&p.addTest(o,t[o]);else{if(t=t.toLowerCase(),p[t]!==n)return p;e="function"==typeof e?e():e,"undefined"!=typeof h&&h&&(g.className+=" "+(e?"":"no-")+t),p[t]=e}return p},o(""),v=c=null,function(t,e){function n(t,e){var n=t.createElement("p"),o=t.getElementsByTagName("head")[0]||t.documentElement;return n.innerHTML="x<style>"+e+"</style>",o.insertBefore(n.lastChild,o.firstChild)}function o(){var t=y.elements;return"string"==typeof t?t.split(" "):t}function i(t){var e=v[t[g]];return e||(e={},m++,t[g]=m,v[m]=e),e}function r(t,n,o){if(n||(n=e),u)return n.createElement(t);o||(o=i(n));var r;return r=o.cache[t]?o.cache[t].cloneNode():h.test(t)?(o.cache[t]=o.createElem(t)).cloneNode():o.createElem(t),!r.canHaveChildren||p.test(t)||r.tagUrn?r:o.frag.appendChild(r)}function s(t,n){if(t||(t=e),u)return t.createDocumentFragment();n=n||i(t);for(var r=n.frag.cloneNode(),s=0,a=o(),l=a.length;l>s;s++)r.createElement(a[s]);return r}function a(t,e){e.cache||(e.cache={},e.createElem=t.createElement,e.createFrag=t.createDocumentFragment,e.frag=e.createFrag()),t.createElement=function(n){return y.shivMethods?r(n,t,e):e.createElem(n)},t.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+o().join().replace(/[\w\-]+/g,function(t){return e.createElem(t),e.frag.createElement(t),'c("'+t+'")'})+");return n}")(y,e.frag)}function l(t){t||(t=e);var o=i(t);return y.shivCSS&&!c&&!o.hasCSS&&(o.hasCSS=!!n(t,"article,aside,dialog,figcaption,figure,footer,header,hgroup,main,nav,section{display:block}mark{background:#FF0;color:#000}template{display:none}")),u||a(t,o),t}var c,u,d="3.7.0",f=t.html5||{},p=/^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i,h=/^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i,g="_html5shiv",m=0,v={};!function(){try{var t=e.createElement("a");t.innerHTML="<xyz></xyz>",c="hidden"in t,u=1==t.childNodes.length||function(){e.createElement("a");var t=e.createDocumentFragment();return"undefined"==typeof t.cloneNode||"undefined"==typeof t.createDocumentFragment||"undefined"==typeof t.createElement}()}catch(n){c=!0,u=!0}}();var y={elements:f.elements||"abbr article aside audio bdi canvas data datalist details dialog figcaption figure footer header hgroup main mark meter nav output progress section summary template time video",version:d,shivCSS:f.shivCSS!==!1,supportsUnknownElements:u,shivMethods:f.shivMethods!==!1,type:"default",shivDocument:l,createElement:r,createDocumentFragment:s};t.html5=y,l(e)}(this,e),p._version=f,p._prefixes=b,p._domPrefixes=A,p._cssomPrefixes=x,p.testProp=function(t){return s([t])},p.testAllProps=l,p.testStyles=S,g.className=g.className.replace(/(^|\s)no-js(\s|$)/,"$1$2")+(h?" js "+E.join(" "):""),p}(this,this.document),function(t,e,n){function o(t){return"[object Function]"==m.call(t)}function i(t){return"string"==typeof t}function r(){}function s(t){return!t||"loaded"==t||"complete"==t||"uninitialized"==t}function a(){var t=v.shift();y=1,t?t.t?h(function(){("c"==t.t?f.injectCss:f.injectJs)(t.s,0,t.a,t.x,t.e,1)},0):(t(),a()):y=0}function l(t,n,o,i,r,l,c){function u(e){if(!p&&s(d.readyState)&&(b.r=p=1,!y&&a(),d.onload=d.onreadystatechange=null,e)){"img"!=t&&h(function(){x.removeChild(d)},50);for(var o in k[n])k[n].hasOwnProperty(o)&&k[n][o].onload()}}var c=c||f.errorTimeout,d=e.createElement(t),p=0,m=0,b={t:o,s:n,e:r,a:l,x:c};1===k[n]&&(m=1,k[n]=[]),"object"==t?d.data=n:(d.src=n,d.type=t),d.width=d.height="0",d.onerror=d.onload=d.onreadystatechange=function(){u.call(this,m)},v.splice(i,0,b),"img"!=t&&(m||2===k[n]?(x.insertBefore(d,w?null:g),h(u,c)):k[n].push(d))}function c(t,e,n,o,r){return y=0,e=e||"j",i(t)?l("c"==e?T:A,t,e,this.i++,n,o,r):(v.splice(this.i++,0,t),1==v.length&&a()),this}function u(){var t=f;return t.loader={load:c,i:0},t}var d,f,p=e.documentElement,h=t.setTimeout,g=e.getElementsByTagName("script")[0],m={}.toString,v=[],y=0,b="MozAppearance"in p.style,w=b&&!!e.createRange().compareNode,x=w?p:g.parentNode,p=t.opera&&"[object Opera]"==m.call(t.opera),p=!!e.attachEvent&&!p,A=b?"object":p?"script":"img",T=p?"script":A,C=Array.isArray||function(t){return"[object Array]"==m.call(t)},E=[],k={},S={timeout:function(t,e){return e.length&&(t.timeout=e[0]),t}};f=function(t){function e(t){var e,n,o,t=t.split("!"),i=E.length,r=t.pop(),s=t.length,r={url:r,origUrl:r,prefixes:t};for(n=0;s>n;n++)o=t[n].split("="),(e=S[o.shift()])&&(r=e(r,o));for(n=0;i>n;n++)r=E[n](r);return r}function s(t,i,r,s,a){var l=e(t),c=l.autoCallback;l.url.split(".").pop().split("?").shift(),l.bypass||(i&&(i=o(i)?i:i[t]||i[s]||i[t.split("/").pop().split("?")[0]]),l.instead?l.instead(t,i,r,s,a):(k[l.url]?l.noexec=!0:k[l.url]=1,r.load(l.url,l.forceCSS||!l.forceJS&&"css"==l.url.split(".").pop().split("?").shift()?"c":n,l.noexec,l.attrs,l.timeout),(o(i)||o(c))&&r.load(function(){u(),i&&i(l.origUrl,a,s),c&&c(l.origUrl,a,s),k[l.url]=2})))}function a(t,e){function n(t,n){if(t){if(i(t))n||(d=function(){var t=[].slice.call(arguments);f.apply(this,t),p()}),s(t,d,e,0,c);else if(Object(t)===t)for(l in a=function(){var e,n=0;for(e in t)t.hasOwnProperty(e)&&n++;return n}(),t)t.hasOwnProperty(l)&&(!n&&!--a&&(o(d)?d=function(){var t=[].slice.call(arguments);f.apply(this,t),p()}:d[l]=function(t){return function(){var e=[].slice.call(arguments);t&&t.apply(this,e),p()}}(f[l])),s(t[l],d,e,l,c))}else!n&&p()}var a,l,c=!!t.test,u=t.load||t.both,d=t.callback||r,f=d,p=t.complete||r;n(c?t.yep:t.nope,!!u),u&&n(u)}var l,c,d=this.yepnope.loader;if(i(t))s(t,0,d,0);else if(C(t))for(l=0;l<t.length;l++)c=t[l],i(c)?s(c,0,d,0):C(c)?f(c):Object(c)===c&&a(c,d);else Object(t)===t&&a(t,d)},f.addPrefix=function(t,e){S[t]=e},f.addFilter=function(t){E.push(t)},f.errorTimeout=1e4,null==e.readyState&&e.addEventListener&&(e.readyState="loading",e.addEventListener("DOMContentLoaded",d=function(){e.removeEventListener("DOMContentLoaded",d,0),e.readyState="complete"},0)),t.yepnope=u(),t.yepnope.executeStack=a,t.yepnope.injectJs=function(t,n,o,i,l,c){var u,d,p=e.createElement("script"),i=i||f.errorTimeout;p.src=t;for(d in o)p.setAttribute(d,o[d]);n=c?a:n||r,p.onreadystatechange=p.onload=function(){!u&&s(p.readyState)&&(u=1,n(),p.onload=p.onreadystatechange=null)},h(function(){u||(u=1,n(1))},i),l?p.onload():g.parentNode.insertBefore(p,g)},t.yepnope.injectCss=function(t,n,o,i,s,l){var c,i=e.createElement("link"),n=l?a:n||r;i.href=t,i.rel="stylesheet",i.type="text/css";for(c in o)i.setAttribute(c,o[c]);s||(g.parentNode.insertBefore(i,g),h(n,0))}}(this,document),Modernizr.load=function(){yepnope.apply(window,[].slice.call(arguments,0))},function(t,e){"object"==typeof module&&"object"==typeof module.exports?module.exports=t.document?e(t,!0):function(t){if(!t.document)throw new Error("jQuery requires a window with a document");return e(t)}:e(t)}("undefined"!=typeof window?window:this,function(t,e){function n(t){var e=t.length,n=Z.type(t);return"function"===n||Z.isWindow(t)?!1:1===t.nodeType&&e?!0:"array"===n||0===e||"number"==typeof e&&e>0&&e-1 in t}function o(t,e,n){if(Z.isFunction(e))return Z.grep(t,function(t,o){return!!e.call(t,o,t)!==n});if(e.nodeType)return Z.grep(t,function(t){return t===e!==n});if("string"==typeof e){if(at.test(e))return Z.filter(e,t,n);e=Z.filter(e,t)}return Z.grep(t,function(t){return Q.call(e,t)>=0!==n})}function i(t,e){for(;(t=t[e])&&1!==t.nodeType;);return t}function r(t){var e=ht[t]={};return Z.each(t.match(pt)||[],function(t,n){e[n]=!0}),e}function s(){G.removeEventListener("DOMContentLoaded",s,!1),t.removeEventListener("load",s,!1),Z.ready()}function a(){Object.defineProperty(this.cache={},0,{get:function(){return{}}}),this.expando=Z.expando+a.uid++}function l(t,e,n){var o;if(void 0===n&&1===t.nodeType)if(o="data-"+e.replace(wt,"-$1").toLowerCase(),n=t.getAttribute(o),"string"==typeof n){try{n="true"===n?!0:"false"===n?!1:"null"===n?null:+n+""===n?+n:bt.test(n)?Z.parseJSON(n):n}catch(i){}yt.set(t,e,n)}else n=void 0;return n}function c(){return!0}function u(){return!1}function d(){try{return G.activeElement}catch(t){}}function f(t,e){return Z.nodeName(t,"table")&&Z.nodeName(11!==e.nodeType?e:e.firstChild,"tr")?t.getElementsByTagName("tbody")[0]||t.appendChild(t.ownerDocument.createElement("tbody")):t}function p(t){return t.type=(null!==t.getAttribute("type"))+"/"+t.type,t}function h(t){var e=Mt.exec(t.type);return e?t.type=e[1]:t.removeAttribute("type"),t}function g(t,e){for(var n=0,o=t.length;o>n;n++)vt.set(t[n],"globalEval",!e||vt.get(e[n],"globalEval"))}function m(t,e){var n,o,i,r,s,a,l,c;if(1===e.nodeType){if(vt.hasData(t)&&(r=vt.access(t),s=vt.set(e,r),c=r.events)){delete s.handle,s.events={};for(i in c)for(n=0,o=c[i].length;o>n;n++)Z.event.add(e,i,c[i][n])}yt.hasData(t)&&(a=yt.access(t),l=Z.extend({},a),yt.set(e,l))}}function v(t,e){var n=t.getElementsByTagName?t.getElementsByTagName(e||"*"):t.querySelectorAll?t.querySelectorAll(e||"*"):[];return void 0===e||e&&Z.nodeName(t,e)?Z.merge([t],n):n}function y(t,e){var n=e.nodeName.toLowerCase();"input"===n&&Ct.test(t.type)?e.checked=t.checked:("input"===n||"textarea"===n)&&(e.defaultValue=t.defaultValue)}function b(e,n){var o,i=Z(n.createElement(e)).appendTo(n.body),r=t.getDefaultComputedStyle&&(o=t.getDefaultComputedStyle(i[0]))?o.display:Z.css(i[0],"display");return i.detach(),r}function w(t){var e=G,n=Ft[t];return n||(n=b(t,e),"none"!==n&&n||(Wt=(Wt||Z("<iframe frameborder='0' width='0' height='0'/>")).appendTo(e.documentElement),e=Wt[0].contentDocument,e.write(),e.close(),n=b(t,e),Wt.detach()),Ft[t]=n),n}function x(t,e,n){var o,i,r,s,a=t.style;return n=n||Bt(t),n&&(s=n.getPropertyValue(e)||n[e]),n&&(""!==s||Z.contains(t.ownerDocument,t)||(s=Z.style(t,e)),Xt.test(s)&&qt.test(e)&&(o=a.width,i=a.minWidth,r=a.maxWidth,a.minWidth=a.maxWidth=a.width=s,s=n.width,a.width=o,a.minWidth=i,a.maxWidth=r)),void 0!==s?s+"":s}function A(t,e){return{get:function(){return t()?void delete this.get:(this.get=e).apply(this,arguments)}}}function T(t,e){if(e in t)return e;for(var n=e[0].toUpperCase()+e.slice(1),o=e,i=Vt.length;i--;)if(e=Vt[i]+n,e in t)return e;return o}function C(t,e,n){var o=Ut.exec(e);return o?Math.max(0,o[1]-(n||0))+(o[2]||"px"):e}function E(t,e,n,o,i){for(var r=n===(o?"border":"content")?4:"width"===e?1:0,s=0;4>r;r+=2)"margin"===n&&(s+=Z.css(t,n+At[r],!0,i)),o?("content"===n&&(s-=Z.css(t,"padding"+At[r],!0,i)),"margin"!==n&&(s-=Z.css(t,"border"+At[r]+"Width",!0,i))):(s+=Z.css(t,"padding"+At[r],!0,i),"padding"!==n&&(s+=Z.css(t,"border"+At[r]+"Width",!0,i)));return s}function k(t,e,n){var o=!0,i="width"===e?t.offsetWidth:t.offsetHeight,r=Bt(t),s="border-box"===Z.css(t,"boxSizing",!1,r);if(0>=i||null==i){if(i=x(t,e,r),(0>i||null==i)&&(i=t.style[e]),Xt.test(i))return i;o=s&&(J.boxSizingReliable()||i===t.style[e]),i=parseFloat(i)||0}return i+E(t,e,n||(s?"border":"content"),o,r)+"px"}function S(t,e){for(var n,o,i,r=[],s=0,a=t.length;a>s;s++)o=t[s],o.style&&(r[s]=vt.get(o,"olddisplay"),n=o.style.display,e?(r[s]||"none"!==n||(o.style.display=""),""===o.style.display&&Tt(o)&&(r[s]=vt.access(o,"olddisplay",w(o.nodeName)))):(i=Tt(o),"none"===n&&i||vt.set(o,"olddisplay",i?n:Z.css(o,"display"))));for(s=0;a>s;s++)o=t[s],o.style&&(e&&"none"!==o.style.display&&""!==o.style.display||(o.style.display=e?r[s]||"":"none"));return t}function D(t,e,n,o,i){return new D.prototype.init(t,e,n,o,i)}function N(){return setTimeout(function(){Jt=void 0}),Jt=Z.now()}function I(t,e){var n,o=0,i={height:t};for(e=e?1:0;4>o;o+=2-e)n=At[o],i["margin"+n]=i["padding"+n]=t;return e&&(i.opacity=i.width=t),i}function L(t,e,n){for(var o,i=(ne[e]||[]).concat(ne["*"]),r=0,s=i.length;s>r;r++)if(o=i[r].call(n,e,t))return o}function $(t,e,n){var o,i,r,s,a,l,c,u,d=this,f={},p=t.style,h=t.nodeType&&Tt(t),g=vt.get(t,"fxshow");n.queue||(a=Z._queueHooks(t,"fx"),null==a.unqueued&&(a.unqueued=0,l=a.empty.fire,a.empty.fire=function(){a.unqueued||l()}),a.unqueued++,d.always(function(){d.always(function(){a.unqueued--,Z.queue(t,"fx").length||a.empty.fire()})})),1===t.nodeType&&("height"in e||"width"in e)&&(n.overflow=[p.overflow,p.overflowX,p.overflowY],c=Z.css(t,"display"),u="none"===c?vt.get(t,"olddisplay")||w(t.nodeName):c,"inline"===u&&"none"===Z.css(t,"float")&&(p.display="inline-block")),n.overflow&&(p.overflow="hidden",d.always(function(){p.overflow=n.overflow[0],p.overflowX=n.overflow[1],p.overflowY=n.overflow[2]}));for(o in e)if(i=e[o],Kt.exec(i)){if(delete e[o],r=r||"toggle"===i,i===(h?"hide":"show")){if("show"!==i||!g||void 0===g[o])continue;h=!0}f[o]=g&&g[o]||Z.style(t,o)}else c=void 0;if(Z.isEmptyObject(f))"inline"===("none"===c?w(t.nodeName):c)&&(p.display=c);else{g?"hidden"in g&&(h=g.hidden):g=vt.access(t,"fxshow",{}),r&&(g.hidden=!h),h?Z(t).show():d.done(function(){Z(t).hide()}),d.done(function(){var e;vt.remove(t,"fxshow");for(e in f)Z.style(t,e,f[e])});for(o in f)s=L(h?g[o]:0,o,d),o in g||(g[o]=s.start,h&&(s.end=s.start,s.start="width"===o||"height"===o?1:0))}}function j(t,e){var n,o,i,r,s;for(n in t)if(o=Z.camelCase(n),i=e[o],r=t[n],Z.isArray(r)&&(i=r[1],r=t[n]=r[0]),n!==o&&(t[o]=r,delete t[n]),s=Z.cssHooks[o],s&&"expand"in s){r=s.expand(r),delete t[o];for(n in r)n in t||(t[n]=r[n],e[n]=i)}else e[o]=i}function O(t,e,n){var o,i,r=0,s=ee.length,a=Z.Deferred().always(function(){delete l.elem}),l=function(){if(i)return!1;for(var e=Jt||N(),n=Math.max(0,c.startTime+c.duration-e),o=n/c.duration||0,r=1-o,s=0,l=c.tweens.length;l>s;s++)c.tweens[s].run(r);return a.notifyWith(t,[c,r,n]),1>r&&l?n:(a.resolveWith(t,[c]),!1)},c=a.promise({elem:t,props:Z.extend({},e),opts:Z.extend(!0,{specialEasing:{}},n),originalProperties:e,originalOptions:n,startTime:Jt||N(),duration:n.duration,tweens:[],createTween:function(e,n){var o=Z.Tween(t,c.opts,e,n,c.opts.specialEasing[e]||c.opts.easing);return c.tweens.push(o),o},stop:function(e){var n=0,o=e?c.tweens.length:0;if(i)return this;for(i=!0;o>n;n++)c.tweens[n].run(1);return e?a.resolveWith(t,[c,e]):a.rejectWith(t,[c,e]),this}}),u=c.props;for(j(u,c.opts.specialEasing);s>r;r++)if(o=ee[r].call(c,t,u,c.opts))return o;return Z.map(u,L,c),Z.isFunction(c.opts.start)&&c.opts.start.call(t,c),Z.fx.timer(Z.extend(l,{elem:t,anim:c,queue:c.opts.queue})),c.progress(c.opts.progress).done(c.opts.done,c.opts.complete).fail(c.opts.fail).always(c.opts.always)}function P(t){return function(e,n){"string"!=typeof e&&(n=e,e="*");var o,i=0,r=e.toLowerCase().match(pt)||[];if(Z.isFunction(n))for(;o=r[i++];)"+"===o[0]?(o=o.slice(1)||"*",(t[o]=t[o]||[]).unshift(n)):(t[o]=t[o]||[]).push(n)}}function M(t,e,n,o){function i(a){var l;return r[a]=!0,Z.each(t[a]||[],function(t,a){var c=a(e,n,o);return"string"!=typeof c||s||r[c]?s?!(l=c):void 0:(e.dataTypes.unshift(c),i(c),!1)}),l}var r={},s=t===be;return i(e.dataTypes[0])||!r["*"]&&i("*")}function R(t,e){var n,o,i=Z.ajaxSettings.flatOptions||{};for(n in e)void 0!==e[n]&&((i[n]?t:o||(o={}))[n]=e[n]);return o&&Z.extend(!0,t,o),t}function H(t,e,n){for(var o,i,r,s,a=t.contents,l=t.dataTypes;"*"===l[0];)l.shift(),void 0===o&&(o=t.mimeType||e.getResponseHeader("Content-Type"));if(o)for(i in a)if(a[i]&&a[i].test(o)){l.unshift(i);break}if(l[0]in n)r=l[0];else{for(i in n){if(!l[0]||t.converters[i+" "+l[0]]){r=i;break}s||(s=i)}r=r||s}return r?(r!==l[0]&&l.unshift(r),n[r]):void 0}function W(t,e,n,o){var i,r,s,a,l,c={},u=t.dataTypes.slice();if(u[1])for(s in t.converters)c[s.toLowerCase()]=t.converters[s];for(r=u.shift();r;)if(t.responseFields[r]&&(n[t.responseFields[r]]=e),!l&&o&&t.dataFilter&&(e=t.dataFilter(e,t.dataType)),l=r,r=u.shift())if("*"===r)r=l;else if("*"!==l&&l!==r){if(s=c[l+" "+r]||c["* "+r],!s)for(i in c)if(a=i.split(" "),a[1]===r&&(s=c[l+" "+a[0]]||c["* "+a[0]])){s===!0?s=c[i]:c[i]!==!0&&(r=a[0],u.unshift(a[1]));break}if(s!==!0)if(s&&t["throws"])e=s(e);else try{e=s(e)}catch(d){return{state:"parsererror",error:s?d:"No conversion from "+l+" to "+r}}}return{state:"success",data:e}}function F(t,e,n,o){var i;if(Z.isArray(e))Z.each(e,function(e,i){n||Ce.test(t)?o(t,i):F(t+"["+("object"==typeof i?e:"")+"]",i,n,o)});else if(n||"object"!==Z.type(e))o(t,e);else for(i in e)F(t+"["+i+"]",e[i],n,o)}function q(t){return Z.isWindow(t)?t:9===t.nodeType&&t.defaultView}var X=[],B=X.slice,Y=X.concat,U=X.push,Q=X.indexOf,z={},_=z.toString,V=z.hasOwnProperty,J={},G=t.document,K="2.1.3",Z=function(t,e){return new Z.fn.init(t,e)},tt=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,et=/^-ms-/,nt=/-([\da-z])/gi,ot=function(t,e){return e.toUpperCase()};Z.fn=Z.prototype={jquery:K,constructor:Z,selector:"",length:0,toArray:function(){return B.call(this)},get:function(t){return null!=t?0>t?this[t+this.length]:this[t]:B.call(this)},pushStack:function(t){var e=Z.merge(this.constructor(),t);return e.prevObject=this,e.context=this.context,e},each:function(t,e){return Z.each(this,t,e)},map:function(t){return this.pushStack(Z.map(this,function(e,n){return t.call(e,n,e)}))},slice:function(){return this.pushStack(B.apply(this,arguments))},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},eq:function(t){var e=this.length,n=+t+(0>t?e:0);return this.pushStack(n>=0&&e>n?[this[n]]:[])},end:function(){return this.prevObject||this.constructor(null)},push:U,sort:X.sort,splice:X.splice},Z.extend=Z.fn.extend=function(){var t,e,n,o,i,r,s=arguments[0]||{},a=1,l=arguments.length,c=!1;for("boolean"==typeof s&&(c=s,s=arguments[a]||{},a++),"object"==typeof s||Z.isFunction(s)||(s={}),a===l&&(s=this,a--);l>a;a++)if(null!=(t=arguments[a]))for(e in t)n=s[e],o=t[e],s!==o&&(c&&o&&(Z.isPlainObject(o)||(i=Z.isArray(o)))?(i?(i=!1,r=n&&Z.isArray(n)?n:[]):r=n&&Z.isPlainObject(n)?n:{},s[e]=Z.extend(c,r,o)):void 0!==o&&(s[e]=o));return s},Z.extend({expando:"jQuery"+(K+Math.random()).replace(/\D/g,""),isReady:!0,error:function(t){throw new Error(t)},noop:function(){},isFunction:function(t){return"function"===Z.type(t)},isArray:Array.isArray,isWindow:function(t){return null!=t&&t===t.window},isNumeric:function(t){return!Z.isArray(t)&&t-parseFloat(t)+1>=0},isPlainObject:function(t){return"object"!==Z.type(t)||t.nodeType||Z.isWindow(t)?!1:t.constructor&&!V.call(t.constructor.prototype,"isPrototypeOf")?!1:!0},isEmptyObject:function(t){var e;for(e in t)return!1;return!0},type:function(t){return null==t?t+"":"object"==typeof t||"function"==typeof t?z[_.call(t)]||"object":typeof t},globalEval:function(t){var e,n=eval;t=Z.trim(t),t&&(1===t.indexOf("use strict")?(e=G.createElement("script"),e.text=t,G.head.appendChild(e).parentNode.removeChild(e)):n(t))},camelCase:function(t){return t.replace(et,"ms-").replace(nt,ot)},nodeName:function(t,e){return t.nodeName&&t.nodeName.toLowerCase()===e.toLowerCase()},each:function(t,e,o){var i,r=0,s=t.length,a=n(t);if(o){if(a)for(;s>r&&(i=e.apply(t[r],o),i!==!1);r++);else for(r in t)if(i=e.apply(t[r],o),i===!1)break}else if(a)for(;s>r&&(i=e.call(t[r],r,t[r]),i!==!1);r++);else for(r in t)if(i=e.call(t[r],r,t[r]),i===!1)break;return t},trim:function(t){return null==t?"":(t+"").replace(tt,"")},makeArray:function(t,e){var o=e||[];return null!=t&&(n(Object(t))?Z.merge(o,"string"==typeof t?[t]:t):U.call(o,t)),o},inArray:function(t,e,n){return null==e?-1:Q.call(e,t,n)},merge:function(t,e){for(var n=+e.length,o=0,i=t.length;n>o;o++)t[i++]=e[o];return t.length=i,t},grep:function(t,e,n){for(var o,i=[],r=0,s=t.length,a=!n;s>r;r++)o=!e(t[r],r),o!==a&&i.push(t[r]);return i},map:function(t,e,o){var i,r=0,s=t.length,a=n(t),l=[];if(a)for(;s>r;r++)i=e(t[r],r,o),null!=i&&l.push(i);else for(r in t)i=e(t[r],r,o),null!=i&&l.push(i);return Y.apply([],l)},guid:1,proxy:function(t,e){var n,o,i;return"string"==typeof e&&(n=t[e],e=t,t=n),Z.isFunction(t)?(o=B.call(arguments,2),i=function(){return t.apply(e||this,o.concat(B.call(arguments)))},i.guid=t.guid=t.guid||Z.guid++,i):void 0},now:Date.now,support:J}),Z.each("Boolean Number String Function Array Date RegExp Object Error".split(" "),function(t,e){z["[object "+e+"]"]=e.toLowerCase()});var it=function(t){function e(t,e,n,o){var i,r,s,a,l,c,d,p,h,g;if((e?e.ownerDocument||e:F)!==$&&L(e),e=e||$,n=n||[],a=e.nodeType,"string"!=typeof t||!t||1!==a&&9!==a&&11!==a)return n;if(!o&&O){if(11!==a&&(i=yt.exec(t)))if(s=i[1]){if(9===a){if(r=e.getElementById(s),!r||!r.parentNode)return n;if(r.id===s)return n.push(r),n}else if(e.ownerDocument&&(r=e.ownerDocument.getElementById(s))&&H(e,r)&&r.id===s)return n.push(r),n}else{if(i[2])return K.apply(n,e.getElementsByTagName(t)),n;if((s=i[3])&&x.getElementsByClassName)return K.apply(n,e.getElementsByClassName(s)),n}if(x.qsa&&(!P||!P.test(t))){if(p=d=W,h=e,g=1!==a&&t,1===a&&"object"!==e.nodeName.toLowerCase()){for(c=E(t),(d=e.getAttribute("id"))?p=d.replace(wt,"\\$&"):e.setAttribute("id",p),p="[id='"+p+"'] ",l=c.length;l--;)c[l]=p+f(c[l]);h=bt.test(t)&&u(e.parentNode)||e,g=c.join(",")}if(g)try{return K.apply(n,h.querySelectorAll(g)),n}catch(m){}finally{d||e.removeAttribute("id")}}}return S(t.replace(lt,"$1"),e,n,o)}function n(){function t(n,o){return e.push(n+" ")>A.cacheLength&&delete t[e.shift()],t[n+" "]=o}var e=[];return t}function o(t){return t[W]=!0,t}function i(t){var e=$.createElement("div");try{return!!t(e)}catch(n){return!1}finally{e.parentNode&&e.parentNode.removeChild(e),e=null}}function r(t,e){for(var n=t.split("|"),o=t.length;o--;)A.attrHandle[n[o]]=e}function s(t,e){var n=e&&t,o=n&&1===t.nodeType&&1===e.nodeType&&(~e.sourceIndex||z)-(~t.sourceIndex||z);if(o)return o;if(n)for(;n=n.nextSibling;)if(n===e)return-1;return t?1:-1}function a(t){return function(e){var n=e.nodeName.toLowerCase();return"input"===n&&e.type===t}}function l(t){return function(e){var n=e.nodeName.toLowerCase();return("input"===n||"button"===n)&&e.type===t}}function c(t){return o(function(e){return e=+e,o(function(n,o){for(var i,r=t([],n.length,e),s=r.length;s--;)n[i=r[s]]&&(n[i]=!(o[i]=n[i]))})})}function u(t){return t&&"undefined"!=typeof t.getElementsByTagName&&t}function d(){}function f(t){for(var e=0,n=t.length,o="";n>e;e++)o+=t[e].value;return o}function p(t,e,n){var o=e.dir,i=n&&"parentNode"===o,r=X++;return e.first?function(e,n,r){for(;e=e[o];)if(1===e.nodeType||i)return t(e,n,r)}:function(e,n,s){var a,l,c=[q,r];if(s){for(;e=e[o];)if((1===e.nodeType||i)&&t(e,n,s))return!0}else for(;e=e[o];)if(1===e.nodeType||i){if(l=e[W]||(e[W]={}),(a=l[o])&&a[0]===q&&a[1]===r)return c[2]=a[2];if(l[o]=c,c[2]=t(e,n,s))return!0}}}function h(t){return t.length>1?function(e,n,o){for(var i=t.length;i--;)if(!t[i](e,n,o))return!1;return!0}:t[0]}function g(t,n,o){for(var i=0,r=n.length;r>i;i++)e(t,n[i],o);return o}function m(t,e,n,o,i){for(var r,s=[],a=0,l=t.length,c=null!=e;l>a;a++)(r=t[a])&&(!n||n(r,o,i))&&(s.push(r),c&&e.push(a));return s}function v(t,e,n,i,r,s){return i&&!i[W]&&(i=v(i)),r&&!r[W]&&(r=v(r,s)),o(function(o,s,a,l){var c,u,d,f=[],p=[],h=s.length,v=o||g(e||"*",a.nodeType?[a]:a,[]),y=!t||!o&&e?v:m(v,f,t,a,l),b=n?r||(o?t:h||i)?[]:s:y;if(n&&n(y,b,a,l),i)for(c=m(b,p),i(c,[],a,l),u=c.length;u--;)(d=c[u])&&(b[p[u]]=!(y[p[u]]=d));if(o){if(r||t){if(r){for(c=[],u=b.length;u--;)(d=b[u])&&c.push(y[u]=d);r(null,b=[],c,l)}for(u=b.length;u--;)(d=b[u])&&(c=r?tt(o,d):f[u])>-1&&(o[c]=!(s[c]=d))}}else b=m(b===s?b.splice(h,b.length):b),r?r(null,s,b,l):K.apply(s,b)})}function y(t){for(var e,n,o,i=t.length,r=A.relative[t[0].type],s=r||A.relative[" "],a=r?1:0,l=p(function(t){return t===e},s,!0),c=p(function(t){return tt(e,t)>-1},s,!0),u=[function(t,n,o){var i=!r&&(o||n!==D)||((e=n).nodeType?l(t,n,o):c(t,n,o));return e=null,i}];i>a;a++)if(n=A.relative[t[a].type])u=[p(h(u),n)];else{if(n=A.filter[t[a].type].apply(null,t[a].matches),n[W]){for(o=++a;i>o&&!A.relative[t[o].type];o++);return v(a>1&&h(u),a>1&&f(t.slice(0,a-1).concat({value:" "===t[a-2].type?"*":""})).replace(lt,"$1"),n,o>a&&y(t.slice(a,o)),i>o&&y(t=t.slice(o)),i>o&&f(t))}u.push(n)}return h(u)}function b(t,n){var i=n.length>0,r=t.length>0,s=function(o,s,a,l,c){var u,d,f,p=0,h="0",g=o&&[],v=[],y=D,b=o||r&&A.find.TAG("*",c),w=q+=null==y?1:Math.random()||.1,x=b.length;for(c&&(D=s!==$&&s);h!==x&&null!=(u=b[h]);h++){if(r&&u){for(d=0;f=t[d++];)if(f(u,s,a)){l.push(u);break}c&&(q=w)}i&&((u=!f&&u)&&p--,o&&g.push(u))}if(p+=h,i&&h!==p){for(d=0;f=n[d++];)f(g,v,s,a);if(o){if(p>0)for(;h--;)g[h]||v[h]||(v[h]=J.call(l));v=m(v)}K.apply(l,v),c&&!o&&v.length>0&&p+n.length>1&&e.uniqueSort(l)}return c&&(q=w,D=y),g};return i?o(s):s}var w,x,A,T,C,E,k,S,D,N,I,L,$,j,O,P,M,R,H,W="sizzle"+1*new Date,F=t.document,q=0,X=0,B=n(),Y=n(),U=n(),Q=function(t,e){return t===e&&(I=!0),0},z=1<<31,_={}.hasOwnProperty,V=[],J=V.pop,G=V.push,K=V.push,Z=V.slice,tt=function(t,e){for(var n=0,o=t.length;o>n;n++)if(t[n]===e)return n;return-1},et="checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",nt="[\\x20\\t\\r\\n\\f]",ot="(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+",it=ot.replace("w","w#"),rt="\\["+nt+"*("+ot+")(?:"+nt+"*([*^$|!~]?=)"+nt+"*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|("+it+"))|)"+nt+"*\\]",st=":("+ot+")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|"+rt+")*)|.*)\\)|)",at=new RegExp(nt+"+","g"),lt=new RegExp("^"+nt+"+|((?:^|[^\\\\])(?:\\\\.)*)"+nt+"+$","g"),ct=new RegExp("^"+nt+"*,"+nt+"*"),ut=new RegExp("^"+nt+"*([>+~]|"+nt+")"+nt+"*"),dt=new RegExp("="+nt+"*([^\\]'\"]*?)"+nt+"*\\]","g"),ft=new RegExp(st),pt=new RegExp("^"+it+"$"),ht={ID:new RegExp("^#("+ot+")"),CLASS:new RegExp("^\\.("+ot+")"),TAG:new RegExp("^("+ot.replace("w","w*")+")"),ATTR:new RegExp("^"+rt),PSEUDO:new RegExp("^"+st),CHILD:new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\("+nt+"*(even|odd|(([+-]|)(\\d*)n|)"+nt+"*(?:([+-]|)"+nt+"*(\\d+)|))"+nt+"*\\)|)","i"),bool:new RegExp("^(?:"+et+")$","i"),needsContext:new RegExp("^"+nt+"*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\("+nt+"*((?:-\\d)?\\d*)"+nt+"*\\)|)(?=[^-]|$)","i")},gt=/^(?:input|select|textarea|button)$/i,mt=/^h\d$/i,vt=/^[^{]+\{\s*\[native \w/,yt=/^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,bt=/[+~]/,wt=/'|\\/g,xt=new RegExp("\\\\([\\da-f]{1,6}"+nt+"?|("+nt+")|.)","ig"),At=function(t,e,n){var o="0x"+e-65536;return o!==o||n?e:0>o?String.fromCharCode(o+65536):String.fromCharCode(o>>10|55296,1023&o|56320)},Tt=function(){L()};try{K.apply(V=Z.call(F.childNodes),F.childNodes),V[F.childNodes.length].nodeType}catch(Ct){K={apply:V.length?function(t,e){G.apply(t,Z.call(e))}:function(t,e){for(var n=t.length,o=0;t[n++]=e[o++];);t.length=n-1}}}x=e.support={},C=e.isXML=function(t){var e=t&&(t.ownerDocument||t).documentElement;return e?"HTML"!==e.nodeName:!1},L=e.setDocument=function(t){var e,n,o=t?t.ownerDocument||t:F;return o!==$&&9===o.nodeType&&o.documentElement?($=o,j=o.documentElement,n=o.defaultView,n&&n!==n.top&&(n.addEventListener?n.addEventListener("unload",Tt,!1):n.attachEvent&&n.attachEvent("onunload",Tt)),O=!C(o),x.attributes=i(function(t){return t.className="i",!t.getAttribute("className")}),x.getElementsByTagName=i(function(t){return t.appendChild(o.createComment("")),!t.getElementsByTagName("*").length}),x.getElementsByClassName=vt.test(o.getElementsByClassName),x.getById=i(function(t){return j.appendChild(t).id=W,!o.getElementsByName||!o.getElementsByName(W).length}),x.getById?(A.find.ID=function(t,e){if("undefined"!=typeof e.getElementById&&O){var n=e.getElementById(t);return n&&n.parentNode?[n]:[]}},A.filter.ID=function(t){var e=t.replace(xt,At);return function(t){return t.getAttribute("id")===e}}):(delete A.find.ID,A.filter.ID=function(t){var e=t.replace(xt,At);return function(t){var n="undefined"!=typeof t.getAttributeNode&&t.getAttributeNode("id");return n&&n.value===e}}),A.find.TAG=x.getElementsByTagName?function(t,e){return"undefined"!=typeof e.getElementsByTagName?e.getElementsByTagName(t):x.qsa?e.querySelectorAll(t):void 0}:function(t,e){var n,o=[],i=0,r=e.getElementsByTagName(t);if("*"===t){for(;n=r[i++];)1===n.nodeType&&o.push(n);return o}return r},A.find.CLASS=x.getElementsByClassName&&function(t,e){return O?e.getElementsByClassName(t):void 0},M=[],P=[],(x.qsa=vt.test(o.querySelectorAll))&&(i(function(t){j.appendChild(t).innerHTML="<a id='"+W+"'></a><select id='"+W+"-\f]' msallowcapture=''><option selected=''></option></select>",t.querySelectorAll("[msallowcapture^='']").length&&P.push("[*^$]="+nt+"*(?:''|\"\")"),t.querySelectorAll("[selected]").length||P.push("\\["+nt+"*(?:value|"+et+")"),t.querySelectorAll("[id~="+W+"-]").length||P.push("~="),t.querySelectorAll(":checked").length||P.push(":checked"),t.querySelectorAll("a#"+W+"+*").length||P.push(".#.+[+~]")}),i(function(t){var e=o.createElement("input");e.setAttribute("type","hidden"),t.appendChild(e).setAttribute("name","D"),t.querySelectorAll("[name=d]").length&&P.push("name"+nt+"*[*^$|!~]?="),t.querySelectorAll(":enabled").length||P.push(":enabled",":disabled"),t.querySelectorAll("*,:x"),P.push(",.*:")})),(x.matchesSelector=vt.test(R=j.matches||j.webkitMatchesSelector||j.mozMatchesSelector||j.oMatchesSelector||j.msMatchesSelector))&&i(function(t){x.disconnectedMatch=R.call(t,"div"),R.call(t,"[s!='']:x"),M.push("!=",st)}),P=P.length&&new RegExp(P.join("|")),M=M.length&&new RegExp(M.join("|")),e=vt.test(j.compareDocumentPosition),H=e||vt.test(j.contains)?function(t,e){var n=9===t.nodeType?t.documentElement:t,o=e&&e.parentNode;return t===o||!(!o||1!==o.nodeType||!(n.contains?n.contains(o):t.compareDocumentPosition&&16&t.compareDocumentPosition(o)));
}:function(t,e){if(e)for(;e=e.parentNode;)if(e===t)return!0;return!1},Q=e?function(t,e){if(t===e)return I=!0,0;var n=!t.compareDocumentPosition-!e.compareDocumentPosition;return n?n:(n=(t.ownerDocument||t)===(e.ownerDocument||e)?t.compareDocumentPosition(e):1,1&n||!x.sortDetached&&e.compareDocumentPosition(t)===n?t===o||t.ownerDocument===F&&H(F,t)?-1:e===o||e.ownerDocument===F&&H(F,e)?1:N?tt(N,t)-tt(N,e):0:4&n?-1:1)}:function(t,e){if(t===e)return I=!0,0;var n,i=0,r=t.parentNode,a=e.parentNode,l=[t],c=[e];if(!r||!a)return t===o?-1:e===o?1:r?-1:a?1:N?tt(N,t)-tt(N,e):0;if(r===a)return s(t,e);for(n=t;n=n.parentNode;)l.unshift(n);for(n=e;n=n.parentNode;)c.unshift(n);for(;l[i]===c[i];)i++;return i?s(l[i],c[i]):l[i]===F?-1:c[i]===F?1:0},o):$},e.matches=function(t,n){return e(t,null,null,n)},e.matchesSelector=function(t,n){if((t.ownerDocument||t)!==$&&L(t),n=n.replace(dt,"='$1']"),!(!x.matchesSelector||!O||M&&M.test(n)||P&&P.test(n)))try{var o=R.call(t,n);if(o||x.disconnectedMatch||t.document&&11!==t.document.nodeType)return o}catch(i){}return e(n,$,null,[t]).length>0},e.contains=function(t,e){return(t.ownerDocument||t)!==$&&L(t),H(t,e)},e.attr=function(t,e){(t.ownerDocument||t)!==$&&L(t);var n=A.attrHandle[e.toLowerCase()],o=n&&_.call(A.attrHandle,e.toLowerCase())?n(t,e,!O):void 0;return void 0!==o?o:x.attributes||!O?t.getAttribute(e):(o=t.getAttributeNode(e))&&o.specified?o.value:null},e.error=function(t){throw new Error("Syntax error, unrecognized expression: "+t)},e.uniqueSort=function(t){var e,n=[],o=0,i=0;if(I=!x.detectDuplicates,N=!x.sortStable&&t.slice(0),t.sort(Q),I){for(;e=t[i++];)e===t[i]&&(o=n.push(i));for(;o--;)t.splice(n[o],1)}return N=null,t},T=e.getText=function(t){var e,n="",o=0,i=t.nodeType;if(i){if(1===i||9===i||11===i){if("string"==typeof t.textContent)return t.textContent;for(t=t.firstChild;t;t=t.nextSibling)n+=T(t)}else if(3===i||4===i)return t.nodeValue}else for(;e=t[o++];)n+=T(e);return n},A=e.selectors={cacheLength:50,createPseudo:o,match:ht,attrHandle:{},find:{},relative:{">":{dir:"parentNode",first:!0}," ":{dir:"parentNode"},"+":{dir:"previousSibling",first:!0},"~":{dir:"previousSibling"}},preFilter:{ATTR:function(t){return t[1]=t[1].replace(xt,At),t[3]=(t[3]||t[4]||t[5]||"").replace(xt,At),"~="===t[2]&&(t[3]=" "+t[3]+" "),t.slice(0,4)},CHILD:function(t){return t[1]=t[1].toLowerCase(),"nth"===t[1].slice(0,3)?(t[3]||e.error(t[0]),t[4]=+(t[4]?t[5]+(t[6]||1):2*("even"===t[3]||"odd"===t[3])),t[5]=+(t[7]+t[8]||"odd"===t[3])):t[3]&&e.error(t[0]),t},PSEUDO:function(t){var e,n=!t[6]&&t[2];return ht.CHILD.test(t[0])?null:(t[3]?t[2]=t[4]||t[5]||"":n&&ft.test(n)&&(e=E(n,!0))&&(e=n.indexOf(")",n.length-e)-n.length)&&(t[0]=t[0].slice(0,e),t[2]=n.slice(0,e)),t.slice(0,3))}},filter:{TAG:function(t){var e=t.replace(xt,At).toLowerCase();return"*"===t?function(){return!0}:function(t){return t.nodeName&&t.nodeName.toLowerCase()===e}},CLASS:function(t){var e=B[t+" "];return e||(e=new RegExp("(^|"+nt+")"+t+"("+nt+"|$)"))&&B(t,function(t){return e.test("string"==typeof t.className&&t.className||"undefined"!=typeof t.getAttribute&&t.getAttribute("class")||"")})},ATTR:function(t,n,o){return function(i){var r=e.attr(i,t);return null==r?"!="===n:n?(r+="","="===n?r===o:"!="===n?r!==o:"^="===n?o&&0===r.indexOf(o):"*="===n?o&&r.indexOf(o)>-1:"$="===n?o&&r.slice(-o.length)===o:"~="===n?(" "+r.replace(at," ")+" ").indexOf(o)>-1:"|="===n?r===o||r.slice(0,o.length+1)===o+"-":!1):!0}},CHILD:function(t,e,n,o,i){var r="nth"!==t.slice(0,3),s="last"!==t.slice(-4),a="of-type"===e;return 1===o&&0===i?function(t){return!!t.parentNode}:function(e,n,l){var c,u,d,f,p,h,g=r!==s?"nextSibling":"previousSibling",m=e.parentNode,v=a&&e.nodeName.toLowerCase(),y=!l&&!a;if(m){if(r){for(;g;){for(d=e;d=d[g];)if(a?d.nodeName.toLowerCase()===v:1===d.nodeType)return!1;h=g="only"===t&&!h&&"nextSibling"}return!0}if(h=[s?m.firstChild:m.lastChild],s&&y){for(u=m[W]||(m[W]={}),c=u[t]||[],p=c[0]===q&&c[1],f=c[0]===q&&c[2],d=p&&m.childNodes[p];d=++p&&d&&d[g]||(f=p=0)||h.pop();)if(1===d.nodeType&&++f&&d===e){u[t]=[q,p,f];break}}else if(y&&(c=(e[W]||(e[W]={}))[t])&&c[0]===q)f=c[1];else for(;(d=++p&&d&&d[g]||(f=p=0)||h.pop())&&((a?d.nodeName.toLowerCase()!==v:1!==d.nodeType)||!++f||(y&&((d[W]||(d[W]={}))[t]=[q,f]),d!==e)););return f-=i,f===o||f%o===0&&f/o>=0}}},PSEUDO:function(t,n){var i,r=A.pseudos[t]||A.setFilters[t.toLowerCase()]||e.error("unsupported pseudo: "+t);return r[W]?r(n):r.length>1?(i=[t,t,"",n],A.setFilters.hasOwnProperty(t.toLowerCase())?o(function(t,e){for(var o,i=r(t,n),s=i.length;s--;)o=tt(t,i[s]),t[o]=!(e[o]=i[s])}):function(t){return r(t,0,i)}):r}},pseudos:{not:o(function(t){var e=[],n=[],i=k(t.replace(lt,"$1"));return i[W]?o(function(t,e,n,o){for(var r,s=i(t,null,o,[]),a=t.length;a--;)(r=s[a])&&(t[a]=!(e[a]=r))}):function(t,o,r){return e[0]=t,i(e,null,r,n),e[0]=null,!n.pop()}}),has:o(function(t){return function(n){return e(t,n).length>0}}),contains:o(function(t){return t=t.replace(xt,At),function(e){return(e.textContent||e.innerText||T(e)).indexOf(t)>-1}}),lang:o(function(t){return pt.test(t||"")||e.error("unsupported lang: "+t),t=t.replace(xt,At).toLowerCase(),function(e){var n;do if(n=O?e.lang:e.getAttribute("xml:lang")||e.getAttribute("lang"))return n=n.toLowerCase(),n===t||0===n.indexOf(t+"-");while((e=e.parentNode)&&1===e.nodeType);return!1}}),target:function(e){var n=t.location&&t.location.hash;return n&&n.slice(1)===e.id},root:function(t){return t===j},focus:function(t){return t===$.activeElement&&(!$.hasFocus||$.hasFocus())&&!!(t.type||t.href||~t.tabIndex)},enabled:function(t){return t.disabled===!1},disabled:function(t){return t.disabled===!0},checked:function(t){var e=t.nodeName.toLowerCase();return"input"===e&&!!t.checked||"option"===e&&!!t.selected},selected:function(t){return t.parentNode&&t.parentNode.selectedIndex,t.selected===!0},empty:function(t){for(t=t.firstChild;t;t=t.nextSibling)if(t.nodeType<6)return!1;return!0},parent:function(t){return!A.pseudos.empty(t)},header:function(t){return mt.test(t.nodeName)},input:function(t){return gt.test(t.nodeName)},button:function(t){var e=t.nodeName.toLowerCase();return"input"===e&&"button"===t.type||"button"===e},text:function(t){var e;return"input"===t.nodeName.toLowerCase()&&"text"===t.type&&(null==(e=t.getAttribute("type"))||"text"===e.toLowerCase())},first:c(function(){return[0]}),last:c(function(t,e){return[e-1]}),eq:c(function(t,e,n){return[0>n?n+e:n]}),even:c(function(t,e){for(var n=0;e>n;n+=2)t.push(n);return t}),odd:c(function(t,e){for(var n=1;e>n;n+=2)t.push(n);return t}),lt:c(function(t,e,n){for(var o=0>n?n+e:n;--o>=0;)t.push(o);return t}),gt:c(function(t,e,n){for(var o=0>n?n+e:n;++o<e;)t.push(o);return t})}},A.pseudos.nth=A.pseudos.eq;for(w in{radio:!0,checkbox:!0,file:!0,password:!0,image:!0})A.pseudos[w]=a(w);for(w in{submit:!0,reset:!0})A.pseudos[w]=l(w);return d.prototype=A.filters=A.pseudos,A.setFilters=new d,E=e.tokenize=function(t,n){var o,i,r,s,a,l,c,u=Y[t+" "];if(u)return n?0:u.slice(0);for(a=t,l=[],c=A.preFilter;a;){(!o||(i=ct.exec(a)))&&(i&&(a=a.slice(i[0].length)||a),l.push(r=[])),o=!1,(i=ut.exec(a))&&(o=i.shift(),r.push({value:o,type:i[0].replace(lt," ")}),a=a.slice(o.length));for(s in A.filter)!(i=ht[s].exec(a))||c[s]&&!(i=c[s](i))||(o=i.shift(),r.push({value:o,type:s,matches:i}),a=a.slice(o.length));if(!o)break}return n?a.length:a?e.error(t):Y(t,l).slice(0)},k=e.compile=function(t,e){var n,o=[],i=[],r=U[t+" "];if(!r){for(e||(e=E(t)),n=e.length;n--;)r=y(e[n]),r[W]?o.push(r):i.push(r);r=U(t,b(i,o)),r.selector=t}return r},S=e.select=function(t,e,n,o){var i,r,s,a,l,c="function"==typeof t&&t,d=!o&&E(t=c.selector||t);if(n=n||[],1===d.length){if(r=d[0]=d[0].slice(0),r.length>2&&"ID"===(s=r[0]).type&&x.getById&&9===e.nodeType&&O&&A.relative[r[1].type]){if(e=(A.find.ID(s.matches[0].replace(xt,At),e)||[])[0],!e)return n;c&&(e=e.parentNode),t=t.slice(r.shift().value.length)}for(i=ht.needsContext.test(t)?0:r.length;i--&&(s=r[i],!A.relative[a=s.type]);)if((l=A.find[a])&&(o=l(s.matches[0].replace(xt,At),bt.test(r[0].type)&&u(e.parentNode)||e))){if(r.splice(i,1),t=o.length&&f(r),!t)return K.apply(n,o),n;break}}return(c||k(t,d))(o,e,!O,n,bt.test(t)&&u(e.parentNode)||e),n},x.sortStable=W.split("").sort(Q).join("")===W,x.detectDuplicates=!!I,L(),x.sortDetached=i(function(t){return 1&t.compareDocumentPosition($.createElement("div"))}),i(function(t){return t.innerHTML="<a href='#'></a>","#"===t.firstChild.getAttribute("href")})||r("type|href|height|width",function(t,e,n){return n?void 0:t.getAttribute(e,"type"===e.toLowerCase()?1:2)}),x.attributes&&i(function(t){return t.innerHTML="<input/>",t.firstChild.setAttribute("value",""),""===t.firstChild.getAttribute("value")})||r("value",function(t,e,n){return n||"input"!==t.nodeName.toLowerCase()?void 0:t.defaultValue}),i(function(t){return null==t.getAttribute("disabled")})||r(et,function(t,e,n){var o;return n?void 0:t[e]===!0?e.toLowerCase():(o=t.getAttributeNode(e))&&o.specified?o.value:null}),e}(t);Z.find=it,Z.expr=it.selectors,Z.expr[":"]=Z.expr.pseudos,Z.unique=it.uniqueSort,Z.text=it.getText,Z.isXMLDoc=it.isXML,Z.contains=it.contains;var rt=Z.expr.match.needsContext,st=/^<(\w+)\s*\/?>(?:<\/\1>|)$/,at=/^.[^:#\[\.,]*$/;Z.filter=function(t,e,n){var o=e[0];return n&&(t=":not("+t+")"),1===e.length&&1===o.nodeType?Z.find.matchesSelector(o,t)?[o]:[]:Z.find.matches(t,Z.grep(e,function(t){return 1===t.nodeType}))},Z.fn.extend({find:function(t){var e,n=this.length,o=[],i=this;if("string"!=typeof t)return this.pushStack(Z(t).filter(function(){for(e=0;n>e;e++)if(Z.contains(i[e],this))return!0}));for(e=0;n>e;e++)Z.find(t,i[e],o);return o=this.pushStack(n>1?Z.unique(o):o),o.selector=this.selector?this.selector+" "+t:t,o},filter:function(t){return this.pushStack(o(this,t||[],!1))},not:function(t){return this.pushStack(o(this,t||[],!0))},is:function(t){return!!o(this,"string"==typeof t&&rt.test(t)?Z(t):t||[],!1).length}});var lt,ct=/^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/,ut=Z.fn.init=function(t,e){var n,o;if(!t)return this;if("string"==typeof t){if(n="<"===t[0]&&">"===t[t.length-1]&&t.length>=3?[null,t,null]:ct.exec(t),!n||!n[1]&&e)return!e||e.jquery?(e||lt).find(t):this.constructor(e).find(t);if(n[1]){if(e=e instanceof Z?e[0]:e,Z.merge(this,Z.parseHTML(n[1],e&&e.nodeType?e.ownerDocument||e:G,!0)),st.test(n[1])&&Z.isPlainObject(e))for(n in e)Z.isFunction(this[n])?this[n](e[n]):this.attr(n,e[n]);return this}return o=G.getElementById(n[2]),o&&o.parentNode&&(this.length=1,this[0]=o),this.context=G,this.selector=t,this}return t.nodeType?(this.context=this[0]=t,this.length=1,this):Z.isFunction(t)?"undefined"!=typeof lt.ready?lt.ready(t):t(Z):(void 0!==t.selector&&(this.selector=t.selector,this.context=t.context),Z.makeArray(t,this))};ut.prototype=Z.fn,lt=Z(G);var dt=/^(?:parents|prev(?:Until|All))/,ft={children:!0,contents:!0,next:!0,prev:!0};Z.extend({dir:function(t,e,n){for(var o=[],i=void 0!==n;(t=t[e])&&9!==t.nodeType;)if(1===t.nodeType){if(i&&Z(t).is(n))break;o.push(t)}return o},sibling:function(t,e){for(var n=[];t;t=t.nextSibling)1===t.nodeType&&t!==e&&n.push(t);return n}}),Z.fn.extend({has:function(t){var e=Z(t,this),n=e.length;return this.filter(function(){for(var t=0;n>t;t++)if(Z.contains(this,e[t]))return!0})},closest:function(t,e){for(var n,o=0,i=this.length,r=[],s=rt.test(t)||"string"!=typeof t?Z(t,e||this.context):0;i>o;o++)for(n=this[o];n&&n!==e;n=n.parentNode)if(n.nodeType<11&&(s?s.index(n)>-1:1===n.nodeType&&Z.find.matchesSelector(n,t))){r.push(n);break}return this.pushStack(r.length>1?Z.unique(r):r)},index:function(t){return t?"string"==typeof t?Q.call(Z(t),this[0]):Q.call(this,t.jquery?t[0]:t):this[0]&&this[0].parentNode?this.first().prevAll().length:-1},add:function(t,e){return this.pushStack(Z.unique(Z.merge(this.get(),Z(t,e))))},addBack:function(t){return this.add(null==t?this.prevObject:this.prevObject.filter(t))}}),Z.each({parent:function(t){var e=t.parentNode;return e&&11!==e.nodeType?e:null},parents:function(t){return Z.dir(t,"parentNode")},parentsUntil:function(t,e,n){return Z.dir(t,"parentNode",n)},next:function(t){return i(t,"nextSibling")},prev:function(t){return i(t,"previousSibling")},nextAll:function(t){return Z.dir(t,"nextSibling")},prevAll:function(t){return Z.dir(t,"previousSibling")},nextUntil:function(t,e,n){return Z.dir(t,"nextSibling",n)},prevUntil:function(t,e,n){return Z.dir(t,"previousSibling",n)},siblings:function(t){return Z.sibling((t.parentNode||{}).firstChild,t)},children:function(t){return Z.sibling(t.firstChild)},contents:function(t){return t.contentDocument||Z.merge([],t.childNodes)}},function(t,e){Z.fn[t]=function(n,o){var i=Z.map(this,e,n);return"Until"!==t.slice(-5)&&(o=n),o&&"string"==typeof o&&(i=Z.filter(o,i)),this.length>1&&(ft[t]||Z.unique(i),dt.test(t)&&i.reverse()),this.pushStack(i)}});var pt=/\S+/g,ht={};Z.Callbacks=function(t){t="string"==typeof t?ht[t]||r(t):Z.extend({},t);var e,n,o,i,s,a,l=[],c=!t.once&&[],u=function(r){for(e=t.memory&&r,n=!0,a=i||0,i=0,s=l.length,o=!0;l&&s>a;a++)if(l[a].apply(r[0],r[1])===!1&&t.stopOnFalse){e=!1;break}o=!1,l&&(c?c.length&&u(c.shift()):e?l=[]:d.disable())},d={add:function(){if(l){var n=l.length;!function r(e){Z.each(e,function(e,n){var o=Z.type(n);"function"===o?t.unique&&d.has(n)||l.push(n):n&&n.length&&"string"!==o&&r(n)})}(arguments),o?s=l.length:e&&(i=n,u(e))}return this},remove:function(){return l&&Z.each(arguments,function(t,e){for(var n;(n=Z.inArray(e,l,n))>-1;)l.splice(n,1),o&&(s>=n&&s--,a>=n&&a--)}),this},has:function(t){return t?Z.inArray(t,l)>-1:!(!l||!l.length)},empty:function(){return l=[],s=0,this},disable:function(){return l=c=e=void 0,this},disabled:function(){return!l},lock:function(){return c=void 0,e||d.disable(),this},locked:function(){return!c},fireWith:function(t,e){return!l||n&&!c||(e=e||[],e=[t,e.slice?e.slice():e],o?c.push(e):u(e)),this},fire:function(){return d.fireWith(this,arguments),this},fired:function(){return!!n}};return d},Z.extend({Deferred:function(t){var e=[["resolve","done",Z.Callbacks("once memory"),"resolved"],["reject","fail",Z.Callbacks("once memory"),"rejected"],["notify","progress",Z.Callbacks("memory")]],n="pending",o={state:function(){return n},always:function(){return i.done(arguments).fail(arguments),this},then:function(){var t=arguments;return Z.Deferred(function(n){Z.each(e,function(e,r){var s=Z.isFunction(t[e])&&t[e];i[r[1]](function(){var t=s&&s.apply(this,arguments);t&&Z.isFunction(t.promise)?t.promise().done(n.resolve).fail(n.reject).progress(n.notify):n[r[0]+"With"](this===o?n.promise():this,s?[t]:arguments)})}),t=null}).promise()},promise:function(t){return null!=t?Z.extend(t,o):o}},i={};return o.pipe=o.then,Z.each(e,function(t,r){var s=r[2],a=r[3];o[r[1]]=s.add,a&&s.add(function(){n=a},e[1^t][2].disable,e[2][2].lock),i[r[0]]=function(){return i[r[0]+"With"](this===i?o:this,arguments),this},i[r[0]+"With"]=s.fireWith}),o.promise(i),t&&t.call(i,i),i},when:function(t){var e,n,o,i=0,r=B.call(arguments),s=r.length,a=1!==s||t&&Z.isFunction(t.promise)?s:0,l=1===a?t:Z.Deferred(),c=function(t,n,o){return function(i){n[t]=this,o[t]=arguments.length>1?B.call(arguments):i,o===e?l.notifyWith(n,o):--a||l.resolveWith(n,o)}};if(s>1)for(e=new Array(s),n=new Array(s),o=new Array(s);s>i;i++)r[i]&&Z.isFunction(r[i].promise)?r[i].promise().done(c(i,o,r)).fail(l.reject).progress(c(i,n,e)):--a;return a||l.resolveWith(o,r),l.promise()}});var gt;Z.fn.ready=function(t){return Z.ready.promise().done(t),this},Z.extend({isReady:!1,readyWait:1,holdReady:function(t){t?Z.readyWait++:Z.ready(!0)},ready:function(t){(t===!0?--Z.readyWait:Z.isReady)||(Z.isReady=!0,t!==!0&&--Z.readyWait>0||(gt.resolveWith(G,[Z]),Z.fn.triggerHandler&&(Z(G).triggerHandler("ready"),Z(G).off("ready"))))}}),Z.ready.promise=function(e){return gt||(gt=Z.Deferred(),"complete"===G.readyState?setTimeout(Z.ready):(G.addEventListener("DOMContentLoaded",s,!1),t.addEventListener("load",s,!1))),gt.promise(e)},Z.ready.promise();var mt=Z.access=function(t,e,n,o,i,r,s){var a=0,l=t.length,c=null==n;if("object"===Z.type(n)){i=!0;for(a in n)Z.access(t,e,a,n[a],!0,r,s)}else if(void 0!==o&&(i=!0,Z.isFunction(o)||(s=!0),c&&(s?(e.call(t,o),e=null):(c=e,e=function(t,e,n){return c.call(Z(t),n)})),e))for(;l>a;a++)e(t[a],n,s?o:o.call(t[a],a,e(t[a],n)));return i?t:c?e.call(t):l?e(t[0],n):r};Z.acceptData=function(t){return 1===t.nodeType||9===t.nodeType||!+t.nodeType},a.uid=1,a.accepts=Z.acceptData,a.prototype={key:function(t){if(!a.accepts(t))return 0;var e={},n=t[this.expando];if(!n){n=a.uid++;try{e[this.expando]={value:n},Object.defineProperties(t,e)}catch(o){e[this.expando]=n,Z.extend(t,e)}}return this.cache[n]||(this.cache[n]={}),n},set:function(t,e,n){var o,i=this.key(t),r=this.cache[i];if("string"==typeof e)r[e]=n;else if(Z.isEmptyObject(r))Z.extend(this.cache[i],e);else for(o in e)r[o]=e[o];return r},get:function(t,e){var n=this.cache[this.key(t)];return void 0===e?n:n[e]},access:function(t,e,n){var o;return void 0===e||e&&"string"==typeof e&&void 0===n?(o=this.get(t,e),void 0!==o?o:this.get(t,Z.camelCase(e))):(this.set(t,e,n),void 0!==n?n:e)},remove:function(t,e){var n,o,i,r=this.key(t),s=this.cache[r];if(void 0===e)this.cache[r]={};else{Z.isArray(e)?o=e.concat(e.map(Z.camelCase)):(i=Z.camelCase(e),e in s?o=[e,i]:(o=i,o=o in s?[o]:o.match(pt)||[])),n=o.length;for(;n--;)delete s[o[n]]}},hasData:function(t){return!Z.isEmptyObject(this.cache[t[this.expando]]||{})},discard:function(t){t[this.expando]&&delete this.cache[t[this.expando]]}};var vt=new a,yt=new a,bt=/^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,wt=/([A-Z])/g;Z.extend({hasData:function(t){return yt.hasData(t)||vt.hasData(t)},data:function(t,e,n){return yt.access(t,e,n)},removeData:function(t,e){yt.remove(t,e)},_data:function(t,e,n){return vt.access(t,e,n)},_removeData:function(t,e){vt.remove(t,e)}}),Z.fn.extend({data:function(t,e){var n,o,i,r=this[0],s=r&&r.attributes;if(void 0===t){if(this.length&&(i=yt.get(r),1===r.nodeType&&!vt.get(r,"hasDataAttrs"))){for(n=s.length;n--;)s[n]&&(o=s[n].name,0===o.indexOf("data-")&&(o=Z.camelCase(o.slice(5)),l(r,o,i[o])));vt.set(r,"hasDataAttrs",!0)}return i}return"object"==typeof t?this.each(function(){yt.set(this,t)}):mt(this,function(e){var n,o=Z.camelCase(t);if(r&&void 0===e){if(n=yt.get(r,t),void 0!==n)return n;if(n=yt.get(r,o),void 0!==n)return n;if(n=l(r,o,void 0),void 0!==n)return n}else this.each(function(){var n=yt.get(this,o);yt.set(this,o,e),-1!==t.indexOf("-")&&void 0!==n&&yt.set(this,t,e)})},null,e,arguments.length>1,null,!0)},removeData:function(t){return this.each(function(){yt.remove(this,t)})}}),Z.extend({queue:function(t,e,n){var o;return t?(e=(e||"fx")+"queue",o=vt.get(t,e),n&&(!o||Z.isArray(n)?o=vt.access(t,e,Z.makeArray(n)):o.push(n)),o||[]):void 0},dequeue:function(t,e){e=e||"fx";var n=Z.queue(t,e),o=n.length,i=n.shift(),r=Z._queueHooks(t,e),s=function(){Z.dequeue(t,e)};"inprogress"===i&&(i=n.shift(),o--),i&&("fx"===e&&n.unshift("inprogress"),delete r.stop,i.call(t,s,r)),!o&&r&&r.empty.fire()},_queueHooks:function(t,e){var n=e+"queueHooks";return vt.get(t,n)||vt.access(t,n,{empty:Z.Callbacks("once memory").add(function(){vt.remove(t,[e+"queue",n])})})}}),Z.fn.extend({queue:function(t,e){var n=2;return"string"!=typeof t&&(e=t,t="fx",n--),arguments.length<n?Z.queue(this[0],t):void 0===e?this:this.each(function(){var n=Z.queue(this,t,e);Z._queueHooks(this,t),"fx"===t&&"inprogress"!==n[0]&&Z.dequeue(this,t)})},dequeue:function(t){return this.each(function(){Z.dequeue(this,t)})},clearQueue:function(t){return this.queue(t||"fx",[])},promise:function(t,e){var n,o=1,i=Z.Deferred(),r=this,s=this.length,a=function(){--o||i.resolveWith(r,[r])};for("string"!=typeof t&&(e=t,t=void 0),t=t||"fx";s--;)n=vt.get(r[s],t+"queueHooks"),n&&n.empty&&(o++,n.empty.add(a));return a(),i.promise(e)}});var xt=/[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,At=["Top","Right","Bottom","Left"],Tt=function(t,e){return t=e||t,"none"===Z.css(t,"display")||!Z.contains(t.ownerDocument,t)},Ct=/^(?:checkbox|radio)$/i;!function(){var t=G.createDocumentFragment(),e=t.appendChild(G.createElement("div")),n=G.createElement("input");n.setAttribute("type","radio"),n.setAttribute("checked","checked"),n.setAttribute("name","t"),e.appendChild(n),J.checkClone=e.cloneNode(!0).cloneNode(!0).lastChild.checked,e.innerHTML="<textarea>x</textarea>",J.noCloneChecked=!!e.cloneNode(!0).lastChild.defaultValue}();var Et="undefined";J.focusinBubbles="onfocusin"in t;var kt=/^key/,St=/^(?:mouse|pointer|contextmenu)|click/,Dt=/^(?:focusinfocus|focusoutblur)$/,Nt=/^([^.]*)(?:\.(.+)|)$/;Z.event={global:{},add:function(t,e,n,o,i){var r,s,a,l,c,u,d,f,p,h,g,m=vt.get(t);if(m)for(n.handler&&(r=n,n=r.handler,i=r.selector),n.guid||(n.guid=Z.guid++),(l=m.events)||(l=m.events={}),(s=m.handle)||(s=m.handle=function(e){return typeof Z!==Et&&Z.event.triggered!==e.type?Z.event.dispatch.apply(t,arguments):void 0}),e=(e||"").match(pt)||[""],c=e.length;c--;)a=Nt.exec(e[c])||[],p=g=a[1],h=(a[2]||"").split(".").sort(),p&&(d=Z.event.special[p]||{},p=(i?d.delegateType:d.bindType)||p,d=Z.event.special[p]||{},u=Z.extend({type:p,origType:g,data:o,handler:n,guid:n.guid,selector:i,needsContext:i&&Z.expr.match.needsContext.test(i),namespace:h.join(".")},r),(f=l[p])||(f=l[p]=[],f.delegateCount=0,d.setup&&d.setup.call(t,o,h,s)!==!1||t.addEventListener&&t.addEventListener(p,s,!1)),d.add&&(d.add.call(t,u),u.handler.guid||(u.handler.guid=n.guid)),i?f.splice(f.delegateCount++,0,u):f.push(u),Z.event.global[p]=!0)},remove:function(t,e,n,o,i){var r,s,a,l,c,u,d,f,p,h,g,m=vt.hasData(t)&&vt.get(t);if(m&&(l=m.events)){for(e=(e||"").match(pt)||[""],c=e.length;c--;)if(a=Nt.exec(e[c])||[],p=g=a[1],h=(a[2]||"").split(".").sort(),p){for(d=Z.event.special[p]||{},p=(o?d.delegateType:d.bindType)||p,f=l[p]||[],a=a[2]&&new RegExp("(^|\\.)"+h.join("\\.(?:.*\\.|)")+"(\\.|$)"),s=r=f.length;r--;)u=f[r],!i&&g!==u.origType||n&&n.guid!==u.guid||a&&!a.test(u.namespace)||o&&o!==u.selector&&("**"!==o||!u.selector)||(f.splice(r,1),u.selector&&f.delegateCount--,d.remove&&d.remove.call(t,u));s&&!f.length&&(d.teardown&&d.teardown.call(t,h,m.handle)!==!1||Z.removeEvent(t,p,m.handle),delete l[p])}else for(p in l)Z.event.remove(t,p+e[c],n,o,!0);Z.isEmptyObject(l)&&(delete m.handle,vt.remove(t,"events"))}},trigger:function(e,n,o,i){var r,s,a,l,c,u,d,f=[o||G],p=V.call(e,"type")?e.type:e,h=V.call(e,"namespace")?e.namespace.split("."):[];if(s=a=o=o||G,3!==o.nodeType&&8!==o.nodeType&&!Dt.test(p+Z.event.triggered)&&(p.indexOf(".")>=0&&(h=p.split("."),p=h.shift(),h.sort()),c=p.indexOf(":")<0&&"on"+p,e=e[Z.expando]?e:new Z.Event(p,"object"==typeof e&&e),e.isTrigger=i?2:3,e.namespace=h.join("."),e.namespace_re=e.namespace?new RegExp("(^|\\.)"+h.join("\\.(?:.*\\.|)")+"(\\.|$)"):null,e.result=void 0,e.target||(e.target=o),n=null==n?[e]:Z.makeArray(n,[e]),d=Z.event.special[p]||{},i||!d.trigger||d.trigger.apply(o,n)!==!1)){if(!i&&!d.noBubble&&!Z.isWindow(o)){for(l=d.delegateType||p,Dt.test(l+p)||(s=s.parentNode);s;s=s.parentNode)f.push(s),a=s;a===(o.ownerDocument||G)&&f.push(a.defaultView||a.parentWindow||t)}for(r=0;(s=f[r++])&&!e.isPropagationStopped();)e.type=r>1?l:d.bindType||p,u=(vt.get(s,"events")||{})[e.type]&&vt.get(s,"handle"),u&&u.apply(s,n),u=c&&s[c],u&&u.apply&&Z.acceptData(s)&&(e.result=u.apply(s,n),e.result===!1&&e.preventDefault());return e.type=p,i||e.isDefaultPrevented()||d._default&&d._default.apply(f.pop(),n)!==!1||!Z.acceptData(o)||c&&Z.isFunction(o[p])&&!Z.isWindow(o)&&(a=o[c],a&&(o[c]=null),Z.event.triggered=p,o[p](),Z.event.triggered=void 0,a&&(o[c]=a)),e.result}},dispatch:function(t){t=Z.event.fix(t);var e,n,o,i,r,s=[],a=B.call(arguments),l=(vt.get(this,"events")||{})[t.type]||[],c=Z.event.special[t.type]||{};if(a[0]=t,t.delegateTarget=this,!c.preDispatch||c.preDispatch.call(this,t)!==!1){for(s=Z.event.handlers.call(this,t,l),e=0;(i=s[e++])&&!t.isPropagationStopped();)for(t.currentTarget=i.elem,n=0;(r=i.handlers[n++])&&!t.isImmediatePropagationStopped();)(!t.namespace_re||t.namespace_re.test(r.namespace))&&(t.handleObj=r,t.data=r.data,o=((Z.event.special[r.origType]||{}).handle||r.handler).apply(i.elem,a),void 0!==o&&(t.result=o)===!1&&(t.preventDefault(),t.stopPropagation()));return c.postDispatch&&c.postDispatch.call(this,t),t.result}},handlers:function(t,e){var n,o,i,r,s=[],a=e.delegateCount,l=t.target;if(a&&l.nodeType&&(!t.button||"click"!==t.type))for(;l!==this;l=l.parentNode||this)if(l.disabled!==!0||"click"!==t.type){for(o=[],n=0;a>n;n++)r=e[n],i=r.selector+" ",void 0===o[i]&&(o[i]=r.needsContext?Z(i,this).index(l)>=0:Z.find(i,this,null,[l]).length),o[i]&&o.push(r);o.length&&s.push({elem:l,handlers:o})}return a<e.length&&s.push({elem:this,handlers:e.slice(a)}),s},props:"altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),fixHooks:{},keyHooks:{props:"char charCode key keyCode".split(" "),filter:function(t,e){return null==t.which&&(t.which=null!=e.charCode?e.charCode:e.keyCode),t}},mouseHooks:{props:"button buttons clientX clientY offsetX offsetY pageX pageY screenX screenY toElement".split(" "),filter:function(t,e){var n,o,i,r=e.button;return null==t.pageX&&null!=e.clientX&&(n=t.target.ownerDocument||G,o=n.documentElement,i=n.body,t.pageX=e.clientX+(o&&o.scrollLeft||i&&i.scrollLeft||0)-(o&&o.clientLeft||i&&i.clientLeft||0),t.pageY=e.clientY+(o&&o.scrollTop||i&&i.scrollTop||0)-(o&&o.clientTop||i&&i.clientTop||0)),t.which||void 0===r||(t.which=1&r?1:2&r?3:4&r?2:0),t}},fix:function(t){if(t[Z.expando])return t;var e,n,o,i=t.type,r=t,s=this.fixHooks[i];for(s||(this.fixHooks[i]=s=St.test(i)?this.mouseHooks:kt.test(i)?this.keyHooks:{}),o=s.props?this.props.concat(s.props):this.props,t=new Z.Event(r),e=o.length;e--;)n=o[e],t[n]=r[n];return t.target||(t.target=G),3===t.target.nodeType&&(t.target=t.target.parentNode),s.filter?s.filter(t,r):t},special:{load:{noBubble:!0},focus:{trigger:function(){return this!==d()&&this.focus?(this.focus(),!1):void 0},delegateType:"focusin"},blur:{trigger:function(){return this===d()&&this.blur?(this.blur(),!1):void 0},delegateType:"focusout"},click:{trigger:function(){return"checkbox"===this.type&&this.click&&Z.nodeName(this,"input")?(this.click(),!1):void 0},_default:function(t){return Z.nodeName(t.target,"a")}},beforeunload:{postDispatch:function(t){void 0!==t.result&&t.originalEvent&&(t.originalEvent.returnValue=t.result)}}},simulate:function(t,e,n,o){var i=Z.extend(new Z.Event,n,{type:t,isSimulated:!0,originalEvent:{}});o?Z.event.trigger(i,null,e):Z.event.dispatch.call(e,i),i.isDefaultPrevented()&&n.preventDefault()}},Z.removeEvent=function(t,e,n){t.removeEventListener&&t.removeEventListener(e,n,!1)},Z.Event=function(t,e){return this instanceof Z.Event?(t&&t.type?(this.originalEvent=t,this.type=t.type,this.isDefaultPrevented=t.defaultPrevented||void 0===t.defaultPrevented&&t.returnValue===!1?c:u):this.type=t,e&&Z.extend(this,e),this.timeStamp=t&&t.timeStamp||Z.now(),void(this[Z.expando]=!0)):new Z.Event(t,e)},Z.Event.prototype={isDefaultPrevented:u,isPropagationStopped:u,isImmediatePropagationStopped:u,preventDefault:function(){var t=this.originalEvent;this.isDefaultPrevented=c,t&&t.preventDefault&&t.preventDefault()},stopPropagation:function(){var t=this.originalEvent;this.isPropagationStopped=c,t&&t.stopPropagation&&t.stopPropagation()},stopImmediatePropagation:function(){var t=this.originalEvent;this.isImmediatePropagationStopped=c,t&&t.stopImmediatePropagation&&t.stopImmediatePropagation(),this.stopPropagation()}},Z.each({mouseenter:"mouseover",mouseleave:"mouseout",pointerenter:"pointerover",pointerleave:"pointerout"},function(t,e){Z.event.special[t]={delegateType:e,bindType:e,handle:function(t){var n,o=this,i=t.relatedTarget,r=t.handleObj;return(!i||i!==o&&!Z.contains(o,i))&&(t.type=r.origType,n=r.handler.apply(this,arguments),t.type=e),n}}}),J.focusinBubbles||Z.each({focus:"focusin",blur:"focusout"},function(t,e){var n=function(t){Z.event.simulate(e,t.target,Z.event.fix(t),!0)};Z.event.special[e]={setup:function(){var o=this.ownerDocument||this,i=vt.access(o,e);i||o.addEventListener(t,n,!0),vt.access(o,e,(i||0)+1)},teardown:function(){var o=this.ownerDocument||this,i=vt.access(o,e)-1;i?vt.access(o,e,i):(o.removeEventListener(t,n,!0),vt.remove(o,e))}}}),Z.fn.extend({on:function(t,e,n,o,i){var r,s;if("object"==typeof t){"string"!=typeof e&&(n=n||e,e=void 0);for(s in t)this.on(s,e,n,t[s],i);return this}if(null==n&&null==o?(o=e,n=e=void 0):null==o&&("string"==typeof e?(o=n,n=void 0):(o=n,n=e,e=void 0)),o===!1)o=u;else if(!o)return this;return 1===i&&(r=o,o=function(t){return Z().off(t),r.apply(this,arguments)},o.guid=r.guid||(r.guid=Z.guid++)),this.each(function(){Z.event.add(this,t,o,n,e)})},one:function(t,e,n,o){return this.on(t,e,n,o,1)},off:function(t,e,n){var o,i;if(t&&t.preventDefault&&t.handleObj)return o=t.handleObj,Z(t.delegateTarget).off(o.namespace?o.origType+"."+o.namespace:o.origType,o.selector,o.handler),this;if("object"==typeof t){for(i in t)this.off(i,e,t[i]);return this}return(e===!1||"function"==typeof e)&&(n=e,e=void 0),n===!1&&(n=u),this.each(function(){Z.event.remove(this,t,n,e)})},trigger:function(t,e){return this.each(function(){Z.event.trigger(t,e,this)})},triggerHandler:function(t,e){var n=this[0];return n?Z.event.trigger(t,e,n,!0):void 0}});var It=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,Lt=/<([\w:]+)/,$t=/<|&#?\w+;/,jt=/<(?:script|style|link)/i,Ot=/checked\s*(?:[^=]|=\s*.checked.)/i,Pt=/^$|\/(?:java|ecma)script/i,Mt=/^true\/(.*)/,Rt=/^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g,Ht={option:[1,"<select multiple='multiple'>","</select>"],thead:[1,"<table>","</table>"],col:[2,"<table><colgroup>","</colgroup></table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],_default:[0,"",""]};Ht.optgroup=Ht.option,Ht.tbody=Ht.tfoot=Ht.colgroup=Ht.caption=Ht.thead,Ht.th=Ht.td,Z.extend({clone:function(t,e,n){var o,i,r,s,a=t.cloneNode(!0),l=Z.contains(t.ownerDocument,t);if(!(J.noCloneChecked||1!==t.nodeType&&11!==t.nodeType||Z.isXMLDoc(t)))for(s=v(a),r=v(t),o=0,i=r.length;i>o;o++)y(r[o],s[o]);if(e)if(n)for(r=r||v(t),s=s||v(a),o=0,i=r.length;i>o;o++)m(r[o],s[o]);else m(t,a);return s=v(a,"script"),s.length>0&&g(s,!l&&v(t,"script")),a},buildFragment:function(t,e,n,o){for(var i,r,s,a,l,c,u=e.createDocumentFragment(),d=[],f=0,p=t.length;p>f;f++)if(i=t[f],i||0===i)if("object"===Z.type(i))Z.merge(d,i.nodeType?[i]:i);else if($t.test(i)){for(r=r||u.appendChild(e.createElement("div")),s=(Lt.exec(i)||["",""])[1].toLowerCase(),a=Ht[s]||Ht._default,r.innerHTML=a[1]+i.replace(It,"<$1></$2>")+a[2],c=a[0];c--;)r=r.lastChild;Z.merge(d,r.childNodes),r=u.firstChild,r.textContent=""}else d.push(e.createTextNode(i));for(u.textContent="",f=0;i=d[f++];)if((!o||-1===Z.inArray(i,o))&&(l=Z.contains(i.ownerDocument,i),r=v(u.appendChild(i),"script"),l&&g(r),n))for(c=0;i=r[c++];)Pt.test(i.type||"")&&n.push(i);return u},cleanData:function(t){for(var e,n,o,i,r=Z.event.special,s=0;void 0!==(n=t[s]);s++){if(Z.acceptData(n)&&(i=n[vt.expando],i&&(e=vt.cache[i]))){if(e.events)for(o in e.events)r[o]?Z.event.remove(n,o):Z.removeEvent(n,o,e.handle);vt.cache[i]&&delete vt.cache[i]}delete yt.cache[n[yt.expando]]}}}),Z.fn.extend({text:function(t){return mt(this,function(t){return void 0===t?Z.text(this):this.empty().each(function(){(1===this.nodeType||11===this.nodeType||9===this.nodeType)&&(this.textContent=t)})},null,t,arguments.length)},append:function(){return this.domManip(arguments,function(t){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var e=f(this,t);e.appendChild(t)}})},prepend:function(){return this.domManip(arguments,function(t){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var e=f(this,t);e.insertBefore(t,e.firstChild)}})},before:function(){return this.domManip(arguments,function(t){this.parentNode&&this.parentNode.insertBefore(t,this)})},after:function(){return this.domManip(arguments,function(t){this.parentNode&&this.parentNode.insertBefore(t,this.nextSibling)})},remove:function(t,e){for(var n,o=t?Z.filter(t,this):this,i=0;null!=(n=o[i]);i++)e||1!==n.nodeType||Z.cleanData(v(n)),
n.parentNode&&(e&&Z.contains(n.ownerDocument,n)&&g(v(n,"script")),n.parentNode.removeChild(n));return this},empty:function(){for(var t,e=0;null!=(t=this[e]);e++)1===t.nodeType&&(Z.cleanData(v(t,!1)),t.textContent="");return this},clone:function(t,e){return t=null==t?!1:t,e=null==e?t:e,this.map(function(){return Z.clone(this,t,e)})},html:function(t){return mt(this,function(t){var e=this[0]||{},n=0,o=this.length;if(void 0===t&&1===e.nodeType)return e.innerHTML;if("string"==typeof t&&!jt.test(t)&&!Ht[(Lt.exec(t)||["",""])[1].toLowerCase()]){t=t.replace(It,"<$1></$2>");try{for(;o>n;n++)e=this[n]||{},1===e.nodeType&&(Z.cleanData(v(e,!1)),e.innerHTML=t);e=0}catch(i){}}e&&this.empty().append(t)},null,t,arguments.length)},replaceWith:function(){var t=arguments[0];return this.domManip(arguments,function(e){t=this.parentNode,Z.cleanData(v(this)),t&&t.replaceChild(e,this)}),t&&(t.length||t.nodeType)?this:this.remove()},detach:function(t){return this.remove(t,!0)},domManip:function(t,e){t=Y.apply([],t);var n,o,i,r,s,a,l=0,c=this.length,u=this,d=c-1,f=t[0],g=Z.isFunction(f);if(g||c>1&&"string"==typeof f&&!J.checkClone&&Ot.test(f))return this.each(function(n){var o=u.eq(n);g&&(t[0]=f.call(this,n,o.html())),o.domManip(t,e)});if(c&&(n=Z.buildFragment(t,this[0].ownerDocument,!1,this),o=n.firstChild,1===n.childNodes.length&&(n=o),o)){for(i=Z.map(v(n,"script"),p),r=i.length;c>l;l++)s=n,l!==d&&(s=Z.clone(s,!0,!0),r&&Z.merge(i,v(s,"script"))),e.call(this[l],s,l);if(r)for(a=i[i.length-1].ownerDocument,Z.map(i,h),l=0;r>l;l++)s=i[l],Pt.test(s.type||"")&&!vt.access(s,"globalEval")&&Z.contains(a,s)&&(s.src?Z._evalUrl&&Z._evalUrl(s.src):Z.globalEval(s.textContent.replace(Rt,"")))}return this}}),Z.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(t,e){Z.fn[t]=function(t){for(var n,o=[],i=Z(t),r=i.length-1,s=0;r>=s;s++)n=s===r?this:this.clone(!0),Z(i[s])[e](n),U.apply(o,n.get());return this.pushStack(o)}});var Wt,Ft={},qt=/^margin/,Xt=new RegExp("^("+xt+")(?!px)[a-z%]+$","i"),Bt=function(e){return e.ownerDocument.defaultView.opener?e.ownerDocument.defaultView.getComputedStyle(e,null):t.getComputedStyle(e,null)};!function(){function e(){s.style.cssText="-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;display:block;margin-top:1%;top:1%;border:1px;padding:1px;width:4px;position:absolute",s.innerHTML="",i.appendChild(r);var e=t.getComputedStyle(s,null);n="1%"!==e.top,o="4px"===e.width,i.removeChild(r)}var n,o,i=G.documentElement,r=G.createElement("div"),s=G.createElement("div");s.style&&(s.style.backgroundClip="content-box",s.cloneNode(!0).style.backgroundClip="",J.clearCloneStyle="content-box"===s.style.backgroundClip,r.style.cssText="border:0;width:0;height:0;top:0;left:-9999px;margin-top:1px;position:absolute",r.appendChild(s),t.getComputedStyle&&Z.extend(J,{pixelPosition:function(){return e(),n},boxSizingReliable:function(){return null==o&&e(),o},reliableMarginRight:function(){var e,n=s.appendChild(G.createElement("div"));return n.style.cssText=s.style.cssText="-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;margin:0;border:0;padding:0",n.style.marginRight=n.style.width="0",s.style.width="1px",i.appendChild(r),e=!parseFloat(t.getComputedStyle(n,null).marginRight),i.removeChild(r),s.removeChild(n),e}}))}(),Z.swap=function(t,e,n,o){var i,r,s={};for(r in e)s[r]=t.style[r],t.style[r]=e[r];i=n.apply(t,o||[]);for(r in e)t.style[r]=s[r];return i};var Yt=/^(none|table(?!-c[ea]).+)/,Ut=new RegExp("^("+xt+")(.*)$","i"),Qt=new RegExp("^([+-])=("+xt+")","i"),zt={position:"absolute",visibility:"hidden",display:"block"},_t={letterSpacing:"0",fontWeight:"400"},Vt=["Webkit","O","Moz","ms"];Z.extend({cssHooks:{opacity:{get:function(t,e){if(e){var n=x(t,"opacity");return""===n?"1":n}}}},cssNumber:{columnCount:!0,fillOpacity:!0,flexGrow:!0,flexShrink:!0,fontWeight:!0,lineHeight:!0,opacity:!0,order:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{"float":"cssFloat"},style:function(t,e,n,o){if(t&&3!==t.nodeType&&8!==t.nodeType&&t.style){var i,r,s,a=Z.camelCase(e),l=t.style;return e=Z.cssProps[a]||(Z.cssProps[a]=T(l,a)),s=Z.cssHooks[e]||Z.cssHooks[a],void 0===n?s&&"get"in s&&void 0!==(i=s.get(t,!1,o))?i:l[e]:(r=typeof n,"string"===r&&(i=Qt.exec(n))&&(n=(i[1]+1)*i[2]+parseFloat(Z.css(t,e)),r="number"),void(null!=n&&n===n&&("number"!==r||Z.cssNumber[a]||(n+="px"),J.clearCloneStyle||""!==n||0!==e.indexOf("background")||(l[e]="inherit"),s&&"set"in s&&void 0===(n=s.set(t,n,o))||(l[e]=n))))}},css:function(t,e,n,o){var i,r,s,a=Z.camelCase(e);return e=Z.cssProps[a]||(Z.cssProps[a]=T(t.style,a)),s=Z.cssHooks[e]||Z.cssHooks[a],s&&"get"in s&&(i=s.get(t,!0,n)),void 0===i&&(i=x(t,e,o)),"normal"===i&&e in _t&&(i=_t[e]),""===n||n?(r=parseFloat(i),n===!0||Z.isNumeric(r)?r||0:i):i}}),Z.each(["height","width"],function(t,e){Z.cssHooks[e]={get:function(t,n,o){return n?Yt.test(Z.css(t,"display"))&&0===t.offsetWidth?Z.swap(t,zt,function(){return k(t,e,o)}):k(t,e,o):void 0},set:function(t,n,o){var i=o&&Bt(t);return C(t,n,o?E(t,e,o,"border-box"===Z.css(t,"boxSizing",!1,i),i):0)}}}),Z.cssHooks.marginRight=A(J.reliableMarginRight,function(t,e){return e?Z.swap(t,{display:"inline-block"},x,[t,"marginRight"]):void 0}),Z.each({margin:"",padding:"",border:"Width"},function(t,e){Z.cssHooks[t+e]={expand:function(n){for(var o=0,i={},r="string"==typeof n?n.split(" "):[n];4>o;o++)i[t+At[o]+e]=r[o]||r[o-2]||r[0];return i}},qt.test(t)||(Z.cssHooks[t+e].set=C)}),Z.fn.extend({css:function(t,e){return mt(this,function(t,e,n){var o,i,r={},s=0;if(Z.isArray(e)){for(o=Bt(t),i=e.length;i>s;s++)r[e[s]]=Z.css(t,e[s],!1,o);return r}return void 0!==n?Z.style(t,e,n):Z.css(t,e)},t,e,arguments.length>1)},show:function(){return S(this,!0)},hide:function(){return S(this)},toggle:function(t){return"boolean"==typeof t?t?this.show():this.hide():this.each(function(){Tt(this)?Z(this).show():Z(this).hide()})}}),Z.Tween=D,D.prototype={constructor:D,init:function(t,e,n,o,i,r){this.elem=t,this.prop=n,this.easing=i||"swing",this.options=e,this.start=this.now=this.cur(),this.end=o,this.unit=r||(Z.cssNumber[n]?"":"px")},cur:function(){var t=D.propHooks[this.prop];return t&&t.get?t.get(this):D.propHooks._default.get(this)},run:function(t){var e,n=D.propHooks[this.prop];return this.options.duration?this.pos=e=Z.easing[this.easing](t,this.options.duration*t,0,1,this.options.duration):this.pos=e=t,this.now=(this.end-this.start)*e+this.start,this.options.step&&this.options.step.call(this.elem,this.now,this),n&&n.set?n.set(this):D.propHooks._default.set(this),this}},D.prototype.init.prototype=D.prototype,D.propHooks={_default:{get:function(t){var e;return null==t.elem[t.prop]||t.elem.style&&null!=t.elem.style[t.prop]?(e=Z.css(t.elem,t.prop,""),e&&"auto"!==e?e:0):t.elem[t.prop]},set:function(t){Z.fx.step[t.prop]?Z.fx.step[t.prop](t):t.elem.style&&(null!=t.elem.style[Z.cssProps[t.prop]]||Z.cssHooks[t.prop])?Z.style(t.elem,t.prop,t.now+t.unit):t.elem[t.prop]=t.now}}},D.propHooks.scrollTop=D.propHooks.scrollLeft={set:function(t){t.elem.nodeType&&t.elem.parentNode&&(t.elem[t.prop]=t.now)}},Z.easing={linear:function(t){return t},swing:function(t){return.5-Math.cos(t*Math.PI)/2}},Z.fx=D.prototype.init,Z.fx.step={};var Jt,Gt,Kt=/^(?:toggle|show|hide)$/,Zt=new RegExp("^(?:([+-])=|)("+xt+")([a-z%]*)$","i"),te=/queueHooks$/,ee=[$],ne={"*":[function(t,e){var n=this.createTween(t,e),o=n.cur(),i=Zt.exec(e),r=i&&i[3]||(Z.cssNumber[t]?"":"px"),s=(Z.cssNumber[t]||"px"!==r&&+o)&&Zt.exec(Z.css(n.elem,t)),a=1,l=20;if(s&&s[3]!==r){r=r||s[3],i=i||[],s=+o||1;do a=a||".5",s/=a,Z.style(n.elem,t,s+r);while(a!==(a=n.cur()/o)&&1!==a&&--l)}return i&&(s=n.start=+s||+o||0,n.unit=r,n.end=i[1]?s+(i[1]+1)*i[2]:+i[2]),n}]};Z.Animation=Z.extend(O,{tweener:function(t,e){Z.isFunction(t)?(e=t,t=["*"]):t=t.split(" ");for(var n,o=0,i=t.length;i>o;o++)n=t[o],ne[n]=ne[n]||[],ne[n].unshift(e)},prefilter:function(t,e){e?ee.unshift(t):ee.push(t)}}),Z.speed=function(t,e,n){var o=t&&"object"==typeof t?Z.extend({},t):{complete:n||!n&&e||Z.isFunction(t)&&t,duration:t,easing:n&&e||e&&!Z.isFunction(e)&&e};return o.duration=Z.fx.off?0:"number"==typeof o.duration?o.duration:o.duration in Z.fx.speeds?Z.fx.speeds[o.duration]:Z.fx.speeds._default,(null==o.queue||o.queue===!0)&&(o.queue="fx"),o.old=o.complete,o.complete=function(){Z.isFunction(o.old)&&o.old.call(this),o.queue&&Z.dequeue(this,o.queue)},o},Z.fn.extend({fadeTo:function(t,e,n,o){return this.filter(Tt).css("opacity",0).show().end().animate({opacity:e},t,n,o)},animate:function(t,e,n,o){var i=Z.isEmptyObject(t),r=Z.speed(e,n,o),s=function(){var e=O(this,Z.extend({},t),r);(i||vt.get(this,"finish"))&&e.stop(!0)};return s.finish=s,i||r.queue===!1?this.each(s):this.queue(r.queue,s)},stop:function(t,e,n){var o=function(t){var e=t.stop;delete t.stop,e(n)};return"string"!=typeof t&&(n=e,e=t,t=void 0),e&&t!==!1&&this.queue(t||"fx",[]),this.each(function(){var e=!0,i=null!=t&&t+"queueHooks",r=Z.timers,s=vt.get(this);if(i)s[i]&&s[i].stop&&o(s[i]);else for(i in s)s[i]&&s[i].stop&&te.test(i)&&o(s[i]);for(i=r.length;i--;)r[i].elem!==this||null!=t&&r[i].queue!==t||(r[i].anim.stop(n),e=!1,r.splice(i,1));(e||!n)&&Z.dequeue(this,t)})},finish:function(t){return t!==!1&&(t=t||"fx"),this.each(function(){var e,n=vt.get(this),o=n[t+"queue"],i=n[t+"queueHooks"],r=Z.timers,s=o?o.length:0;for(n.finish=!0,Z.queue(this,t,[]),i&&i.stop&&i.stop.call(this,!0),e=r.length;e--;)r[e].elem===this&&r[e].queue===t&&(r[e].anim.stop(!0),r.splice(e,1));for(e=0;s>e;e++)o[e]&&o[e].finish&&o[e].finish.call(this);delete n.finish})}}),Z.each(["toggle","show","hide"],function(t,e){var n=Z.fn[e];Z.fn[e]=function(t,o,i){return null==t||"boolean"==typeof t?n.apply(this,arguments):this.animate(I(e,!0),t,o,i)}}),Z.each({slideDown:I("show"),slideUp:I("hide"),slideToggle:I("toggle"),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(t,e){Z.fn[t]=function(t,n,o){return this.animate(e,t,n,o)}}),Z.timers=[],Z.fx.tick=function(){var t,e=0,n=Z.timers;for(Jt=Z.now();e<n.length;e++)t=n[e],t()||n[e]!==t||n.splice(e--,1);n.length||Z.fx.stop(),Jt=void 0},Z.fx.timer=function(t){Z.timers.push(t),t()?Z.fx.start():Z.timers.pop()},Z.fx.interval=13,Z.fx.start=function(){Gt||(Gt=setInterval(Z.fx.tick,Z.fx.interval))},Z.fx.stop=function(){clearInterval(Gt),Gt=null},Z.fx.speeds={slow:600,fast:200,_default:400},Z.fn.delay=function(t,e){return t=Z.fx?Z.fx.speeds[t]||t:t,e=e||"fx",this.queue(e,function(e,n){var o=setTimeout(e,t);n.stop=function(){clearTimeout(o)}})},function(){var t=G.createElement("input"),e=G.createElement("select"),n=e.appendChild(G.createElement("option"));t.type="checkbox",J.checkOn=""!==t.value,J.optSelected=n.selected,e.disabled=!0,J.optDisabled=!n.disabled,t=G.createElement("input"),t.value="t",t.type="radio",J.radioValue="t"===t.value}();var oe,ie,re=Z.expr.attrHandle;Z.fn.extend({attr:function(t,e){return mt(this,Z.attr,t,e,arguments.length>1)},removeAttr:function(t){return this.each(function(){Z.removeAttr(this,t)})}}),Z.extend({attr:function(t,e,n){var o,i,r=t.nodeType;return t&&3!==r&&8!==r&&2!==r?typeof t.getAttribute===Et?Z.prop(t,e,n):(1===r&&Z.isXMLDoc(t)||(e=e.toLowerCase(),o=Z.attrHooks[e]||(Z.expr.match.bool.test(e)?ie:oe)),void 0===n?o&&"get"in o&&null!==(i=o.get(t,e))?i:(i=Z.find.attr(t,e),null==i?void 0:i):null!==n?o&&"set"in o&&void 0!==(i=o.set(t,n,e))?i:(t.setAttribute(e,n+""),n):void Z.removeAttr(t,e)):void 0},removeAttr:function(t,e){var n,o,i=0,r=e&&e.match(pt);if(r&&1===t.nodeType)for(;n=r[i++];)o=Z.propFix[n]||n,Z.expr.match.bool.test(n)&&(t[o]=!1),t.removeAttribute(n)},attrHooks:{type:{set:function(t,e){if(!J.radioValue&&"radio"===e&&Z.nodeName(t,"input")){var n=t.value;return t.setAttribute("type",e),n&&(t.value=n),e}}}}}),ie={set:function(t,e,n){return e===!1?Z.removeAttr(t,n):t.setAttribute(n,n),n}},Z.each(Z.expr.match.bool.source.match(/\w+/g),function(t,e){var n=re[e]||Z.find.attr;re[e]=function(t,e,o){var i,r;return o||(r=re[e],re[e]=i,i=null!=n(t,e,o)?e.toLowerCase():null,re[e]=r),i}});var se=/^(?:input|select|textarea|button)$/i;Z.fn.extend({prop:function(t,e){return mt(this,Z.prop,t,e,arguments.length>1)},removeProp:function(t){return this.each(function(){delete this[Z.propFix[t]||t]})}}),Z.extend({propFix:{"for":"htmlFor","class":"className"},prop:function(t,e,n){var o,i,r,s=t.nodeType;return t&&3!==s&&8!==s&&2!==s?(r=1!==s||!Z.isXMLDoc(t),r&&(e=Z.propFix[e]||e,i=Z.propHooks[e]),void 0!==n?i&&"set"in i&&void 0!==(o=i.set(t,n,e))?o:t[e]=n:i&&"get"in i&&null!==(o=i.get(t,e))?o:t[e]):void 0},propHooks:{tabIndex:{get:function(t){return t.hasAttribute("tabindex")||se.test(t.nodeName)||t.href?t.tabIndex:-1}}}}),J.optSelected||(Z.propHooks.selected={get:function(t){var e=t.parentNode;return e&&e.parentNode&&e.parentNode.selectedIndex,null}}),Z.each(["tabIndex","readOnly","maxLength","cellSpacing","cellPadding","rowSpan","colSpan","useMap","frameBorder","contentEditable"],function(){Z.propFix[this.toLowerCase()]=this});var ae=/[\t\r\n\f]/g;Z.fn.extend({addClass:function(t){var e,n,o,i,r,s,a="string"==typeof t&&t,l=0,c=this.length;if(Z.isFunction(t))return this.each(function(e){Z(this).addClass(t.call(this,e,this.className))});if(a)for(e=(t||"").match(pt)||[];c>l;l++)if(n=this[l],o=1===n.nodeType&&(n.className?(" "+n.className+" ").replace(ae," "):" ")){for(r=0;i=e[r++];)o.indexOf(" "+i+" ")<0&&(o+=i+" ");s=Z.trim(o),n.className!==s&&(n.className=s)}return this},removeClass:function(t){var e,n,o,i,r,s,a=0===arguments.length||"string"==typeof t&&t,l=0,c=this.length;if(Z.isFunction(t))return this.each(function(e){Z(this).removeClass(t.call(this,e,this.className))});if(a)for(e=(t||"").match(pt)||[];c>l;l++)if(n=this[l],o=1===n.nodeType&&(n.className?(" "+n.className+" ").replace(ae," "):"")){for(r=0;i=e[r++];)for(;o.indexOf(" "+i+" ")>=0;)o=o.replace(" "+i+" "," ");s=t?Z.trim(o):"",n.className!==s&&(n.className=s)}return this},toggleClass:function(t,e){var n=typeof t;return"boolean"==typeof e&&"string"===n?e?this.addClass(t):this.removeClass(t):this.each(Z.isFunction(t)?function(n){Z(this).toggleClass(t.call(this,n,this.className,e),e)}:function(){if("string"===n)for(var e,o=0,i=Z(this),r=t.match(pt)||[];e=r[o++];)i.hasClass(e)?i.removeClass(e):i.addClass(e);else(n===Et||"boolean"===n)&&(this.className&&vt.set(this,"__className__",this.className),this.className=this.className||t===!1?"":vt.get(this,"__className__")||"")})},hasClass:function(t){for(var e=" "+t+" ",n=0,o=this.length;o>n;n++)if(1===this[n].nodeType&&(" "+this[n].className+" ").replace(ae," ").indexOf(e)>=0)return!0;return!1}});var le=/\r/g;Z.fn.extend({val:function(t){var e,n,o,i=this[0];return arguments.length?(o=Z.isFunction(t),this.each(function(n){var i;1===this.nodeType&&(i=o?t.call(this,n,Z(this).val()):t,null==i?i="":"number"==typeof i?i+="":Z.isArray(i)&&(i=Z.map(i,function(t){return null==t?"":t+""})),e=Z.valHooks[this.type]||Z.valHooks[this.nodeName.toLowerCase()],e&&"set"in e&&void 0!==e.set(this,i,"value")||(this.value=i))})):i?(e=Z.valHooks[i.type]||Z.valHooks[i.nodeName.toLowerCase()],e&&"get"in e&&void 0!==(n=e.get(i,"value"))?n:(n=i.value,"string"==typeof n?n.replace(le,""):null==n?"":n)):void 0}}),Z.extend({valHooks:{option:{get:function(t){var e=Z.find.attr(t,"value");return null!=e?e:Z.trim(Z.text(t))}},select:{get:function(t){for(var e,n,o=t.options,i=t.selectedIndex,r="select-one"===t.type||0>i,s=r?null:[],a=r?i+1:o.length,l=0>i?a:r?i:0;a>l;l++)if(n=o[l],!(!n.selected&&l!==i||(J.optDisabled?n.disabled:null!==n.getAttribute("disabled"))||n.parentNode.disabled&&Z.nodeName(n.parentNode,"optgroup"))){if(e=Z(n).val(),r)return e;s.push(e)}return s},set:function(t,e){for(var n,o,i=t.options,r=Z.makeArray(e),s=i.length;s--;)o=i[s],(o.selected=Z.inArray(o.value,r)>=0)&&(n=!0);return n||(t.selectedIndex=-1),r}}}}),Z.each(["radio","checkbox"],function(){Z.valHooks[this]={set:function(t,e){return Z.isArray(e)?t.checked=Z.inArray(Z(t).val(),e)>=0:void 0}},J.checkOn||(Z.valHooks[this].get=function(t){return null===t.getAttribute("value")?"on":t.value})}),Z.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "),function(t,e){Z.fn[e]=function(t,n){return arguments.length>0?this.on(e,null,t,n):this.trigger(e)}}),Z.fn.extend({hover:function(t,e){return this.mouseenter(t).mouseleave(e||t)},bind:function(t,e,n){return this.on(t,null,e,n)},unbind:function(t,e){return this.off(t,null,e)},delegate:function(t,e,n,o){return this.on(e,t,n,o)},undelegate:function(t,e,n){return 1===arguments.length?this.off(t,"**"):this.off(e,t||"**",n)}});var ce=Z.now(),ue=/\?/;Z.parseJSON=function(t){return JSON.parse(t+"")},Z.parseXML=function(t){var e,n;if(!t||"string"!=typeof t)return null;try{n=new DOMParser,e=n.parseFromString(t,"text/xml")}catch(o){e=void 0}return(!e||e.getElementsByTagName("parsererror").length)&&Z.error("Invalid XML: "+t),e};var de=/#.*$/,fe=/([?&])_=[^&]*/,pe=/^(.*?):[ \t]*([^\r\n]*)$/gm,he=/^(?:about|app|app-storage|.+-extension|file|res|widget):$/,ge=/^(?:GET|HEAD)$/,me=/^\/\//,ve=/^([\w.+-]+:)(?:\/\/(?:[^\/?#]*@|)([^\/?#:]*)(?::(\d+)|)|)/,ye={},be={},we="*/".concat("*"),xe=t.location.href,Ae=ve.exec(xe.toLowerCase())||[];Z.extend({active:0,lastModified:{},etag:{},ajaxSettings:{url:xe,type:"GET",isLocal:he.test(Ae[1]),global:!0,processData:!0,async:!0,contentType:"application/x-www-form-urlencoded; charset=UTF-8",accepts:{"*":we,text:"text/plain",html:"text/html",xml:"application/xml, text/xml",json:"application/json, text/javascript"},contents:{xml:/xml/,html:/html/,json:/json/},responseFields:{xml:"responseXML",text:"responseText",json:"responseJSON"},converters:{"* text":String,"text html":!0,"text json":Z.parseJSON,"text xml":Z.parseXML},flatOptions:{url:!0,context:!0}},ajaxSetup:function(t,e){return e?R(R(t,Z.ajaxSettings),e):R(Z.ajaxSettings,t)},ajaxPrefilter:P(ye),ajaxTransport:P(be),ajax:function(t,e){function n(t,e,n,s){var l,u,v,y,w,A=e;2!==b&&(b=2,a&&clearTimeout(a),o=void 0,r=s||"",x.readyState=t>0?4:0,l=t>=200&&300>t||304===t,n&&(y=H(d,x,n)),y=W(d,y,x,l),l?(d.ifModified&&(w=x.getResponseHeader("Last-Modified"),w&&(Z.lastModified[i]=w),w=x.getResponseHeader("etag"),w&&(Z.etag[i]=w)),204===t||"HEAD"===d.type?A="nocontent":304===t?A="notmodified":(A=y.state,u=y.data,v=y.error,l=!v)):(v=A,(t||!A)&&(A="error",0>t&&(t=0))),x.status=t,x.statusText=(e||A)+"",l?h.resolveWith(f,[u,A,x]):h.rejectWith(f,[x,A,v]),x.statusCode(m),m=void 0,c&&p.trigger(l?"ajaxSuccess":"ajaxError",[x,d,l?u:v]),g.fireWith(f,[x,A]),c&&(p.trigger("ajaxComplete",[x,d]),--Z.active||Z.event.trigger("ajaxStop")))}"object"==typeof t&&(e=t,t=void 0),e=e||{};var o,i,r,s,a,l,c,u,d=Z.ajaxSetup({},e),f=d.context||d,p=d.context&&(f.nodeType||f.jquery)?Z(f):Z.event,h=Z.Deferred(),g=Z.Callbacks("once memory"),m=d.statusCode||{},v={},y={},b=0,w="canceled",x={readyState:0,getResponseHeader:function(t){var e;if(2===b){if(!s)for(s={};e=pe.exec(r);)s[e[1].toLowerCase()]=e[2];e=s[t.toLowerCase()]}return null==e?null:e},getAllResponseHeaders:function(){return 2===b?r:null},setRequestHeader:function(t,e){var n=t.toLowerCase();return b||(t=y[n]=y[n]||t,v[t]=e),this},overrideMimeType:function(t){return b||(d.mimeType=t),this},statusCode:function(t){var e;if(t)if(2>b)for(e in t)m[e]=[m[e],t[e]];else x.always(t[x.status]);return this},abort:function(t){var e=t||w;return o&&o.abort(e),n(0,e),this}};if(h.promise(x).complete=g.add,x.success=x.done,x.error=x.fail,d.url=((t||d.url||xe)+"").replace(de,"").replace(me,Ae[1]+"//"),d.type=e.method||e.type||d.method||d.type,d.dataTypes=Z.trim(d.dataType||"*").toLowerCase().match(pt)||[""],null==d.crossDomain&&(l=ve.exec(d.url.toLowerCase()),d.crossDomain=!(!l||l[1]===Ae[1]&&l[2]===Ae[2]&&(l[3]||("http:"===l[1]?"80":"443"))===(Ae[3]||("http:"===Ae[1]?"80":"443")))),d.data&&d.processData&&"string"!=typeof d.data&&(d.data=Z.param(d.data,d.traditional)),M(ye,d,e,x),2===b)return x;c=Z.event&&d.global,c&&0===Z.active++&&Z.event.trigger("ajaxStart"),d.type=d.type.toUpperCase(),d.hasContent=!ge.test(d.type),i=d.url,d.hasContent||(d.data&&(i=d.url+=(ue.test(i)?"&":"?")+d.data,delete d.data),d.cache===!1&&(d.url=fe.test(i)?i.replace(fe,"$1_="+ce++):i+(ue.test(i)?"&":"?")+"_="+ce++)),d.ifModified&&(Z.lastModified[i]&&x.setRequestHeader("If-Modified-Since",Z.lastModified[i]),Z.etag[i]&&x.setRequestHeader("If-None-Match",Z.etag[i])),(d.data&&d.hasContent&&d.contentType!==!1||e.contentType)&&x.setRequestHeader("Content-Type",d.contentType),x.setRequestHeader("Accept",d.dataTypes[0]&&d.accepts[d.dataTypes[0]]?d.accepts[d.dataTypes[0]]+("*"!==d.dataTypes[0]?", "+we+"; q=0.01":""):d.accepts["*"]);for(u in d.headers)x.setRequestHeader(u,d.headers[u]);if(d.beforeSend&&(d.beforeSend.call(f,x,d)===!1||2===b))return x.abort();w="abort";for(u in{success:1,error:1,complete:1})x[u](d[u]);if(o=M(be,d,e,x)){x.readyState=1,c&&p.trigger("ajaxSend",[x,d]),d.async&&d.timeout>0&&(a=setTimeout(function(){x.abort("timeout")},d.timeout));try{b=1,o.send(v,n)}catch(A){if(!(2>b))throw A;n(-1,A)}}else n(-1,"No Transport");return x},getJSON:function(t,e,n){return Z.get(t,e,n,"json")},getScript:function(t,e){return Z.get(t,void 0,e,"script")}}),Z.each(["get","post"],function(t,e){Z[e]=function(t,n,o,i){return Z.isFunction(n)&&(i=i||o,o=n,n=void 0),Z.ajax({url:t,type:e,dataType:i,data:n,success:o})}}),Z._evalUrl=function(t){return Z.ajax({url:t,type:"GET",dataType:"script",async:!1,global:!1,"throws":!0})},Z.fn.extend({wrapAll:function(t){var e;return Z.isFunction(t)?this.each(function(e){Z(this).wrapAll(t.call(this,e))}):(this[0]&&(e=Z(t,this[0].ownerDocument).eq(0).clone(!0),this[0].parentNode&&e.insertBefore(this[0]),e.map(function(){for(var t=this;t.firstElementChild;)t=t.firstElementChild;return t}).append(this)),this)},wrapInner:function(t){return this.each(Z.isFunction(t)?function(e){Z(this).wrapInner(t.call(this,e))}:function(){var e=Z(this),n=e.contents();n.length?n.wrapAll(t):e.append(t)})},wrap:function(t){var e=Z.isFunction(t);return this.each(function(n){Z(this).wrapAll(e?t.call(this,n):t)})},unwrap:function(){return this.parent().each(function(){Z.nodeName(this,"body")||Z(this).replaceWith(this.childNodes)}).end()}}),Z.expr.filters.hidden=function(t){return t.offsetWidth<=0&&t.offsetHeight<=0},Z.expr.filters.visible=function(t){return!Z.expr.filters.hidden(t)};var Te=/%20/g,Ce=/\[\]$/,Ee=/\r?\n/g,ke=/^(?:submit|button|image|reset|file)$/i,Se=/^(?:input|select|textarea|keygen)/i;Z.param=function(t,e){var n,o=[],i=function(t,e){e=Z.isFunction(e)?e():null==e?"":e,o[o.length]=encodeURIComponent(t)+"="+encodeURIComponent(e)};if(void 0===e&&(e=Z.ajaxSettings&&Z.ajaxSettings.traditional),Z.isArray(t)||t.jquery&&!Z.isPlainObject(t))Z.each(t,function(){i(this.name,this.value)});else for(n in t)F(n,t[n],e,i);return o.join("&").replace(Te,"+")},Z.fn.extend({serialize:function(){return Z.param(this.serializeArray())},serializeArray:function(){return this.map(function(){var t=Z.prop(this,"elements");return t?Z.makeArray(t):this}).filter(function(){var t=this.type;return this.name&&!Z(this).is(":disabled")&&Se.test(this.nodeName)&&!ke.test(t)&&(this.checked||!Ct.test(t))}).map(function(t,e){var n=Z(this).val();return null==n?null:Z.isArray(n)?Z.map(n,function(t){return{name:e.name,value:t.replace(Ee,"\r\n")}}):{name:e.name,value:n.replace(Ee,"\r\n")}}).get()}}),Z.ajaxSettings.xhr=function(){try{return new XMLHttpRequest}catch(t){}};var De=0,Ne={},Ie={0:200,1223:204},Le=Z.ajaxSettings.xhr();t.attachEvent&&t.attachEvent("onunload",function(){for(var t in Ne)Ne[t]()}),J.cors=!!Le&&"withCredentials"in Le,J.ajax=Le=!!Le,Z.ajaxTransport(function(t){var e;return J.cors||Le&&!t.crossDomain?{send:function(n,o){var i,r=t.xhr(),s=++De;if(r.open(t.type,t.url,t.async,t.username,t.password),t.xhrFields)for(i in t.xhrFields)r[i]=t.xhrFields[i];t.mimeType&&r.overrideMimeType&&r.overrideMimeType(t.mimeType),t.crossDomain||n["X-Requested-With"]||(n["X-Requested-With"]="XMLHttpRequest");for(i in n)r.setRequestHeader(i,n[i]);e=function(t){return function(){e&&(delete Ne[s],e=r.onload=r.onerror=null,"abort"===t?r.abort():"error"===t?o(r.status,r.statusText):o(Ie[r.status]||r.status,r.statusText,"string"==typeof r.responseText?{text:r.responseText}:void 0,r.getAllResponseHeaders()))}},r.onload=e(),r.onerror=e("error"),e=Ne[s]=e("abort");try{r.send(t.hasContent&&t.data||null)}catch(a){if(e)throw a}},abort:function(){e&&e()}}:void 0}),Z.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"},contents:{script:/(?:java|ecma)script/},converters:{"text script":function(t){return Z.globalEval(t),t}}}),Z.ajaxPrefilter("script",function(t){void 0===t.cache&&(t.cache=!1),t.crossDomain&&(t.type="GET")}),Z.ajaxTransport("script",function(t){if(t.crossDomain){var e,n;return{send:function(o,i){e=Z("<script>").prop({async:!0,charset:t.scriptCharset,src:t.url}).on("load error",n=function(t){e.remove(),n=null,t&&i("error"===t.type?404:200,t.type)}),G.head.appendChild(e[0])},abort:function(){n&&n()}}}});var $e=[],je=/(=)\?(?=&|$)|\?\?/;Z.ajaxSetup({jsonp:"callback",jsonpCallback:function(){var t=$e.pop()||Z.expando+"_"+ce++;return this[t]=!0,t}}),Z.ajaxPrefilter("json jsonp",function(e,n,o){var i,r,s,a=e.jsonp!==!1&&(je.test(e.url)?"url":"string"==typeof e.data&&!(e.contentType||"").indexOf("application/x-www-form-urlencoded")&&je.test(e.data)&&"data");return a||"jsonp"===e.dataTypes[0]?(i=e.jsonpCallback=Z.isFunction(e.jsonpCallback)?e.jsonpCallback():e.jsonpCallback,a?e[a]=e[a].replace(je,"$1"+i):e.jsonp!==!1&&(e.url+=(ue.test(e.url)?"&":"?")+e.jsonp+"="+i),e.converters["script json"]=function(){return s||Z.error(i+" was not called"),s[0]},e.dataTypes[0]="json",r=t[i],t[i]=function(){s=arguments},o.always(function(){t[i]=r,e[i]&&(e.jsonpCallback=n.jsonpCallback,$e.push(i)),s&&Z.isFunction(r)&&r(s[0]),s=r=void 0}),"script"):void 0}),Z.parseHTML=function(t,e,n){if(!t||"string"!=typeof t)return null;"boolean"==typeof e&&(n=e,e=!1),e=e||G;var o=st.exec(t),i=!n&&[];return o?[e.createElement(o[1])]:(o=Z.buildFragment([t],e,i),i&&i.length&&Z(i).remove(),Z.merge([],o.childNodes))};var Oe=Z.fn.load;Z.fn.load=function(t,e,n){if("string"!=typeof t&&Oe)return Oe.apply(this,arguments);var o,i,r,s=this,a=t.indexOf(" ");return a>=0&&(o=Z.trim(t.slice(a)),t=t.slice(0,a)),Z.isFunction(e)?(n=e,e=void 0):e&&"object"==typeof e&&(i="POST"),s.length>0&&Z.ajax({url:t,type:i,dataType:"html",data:e}).done(function(t){r=arguments,s.html(o?Z("<div>").append(Z.parseHTML(t)).find(o):t)}).complete(n&&function(t,e){s.each(n,r||[t.responseText,e,t])}),this},Z.each(["ajaxStart","ajaxStop","ajaxComplete","ajaxError","ajaxSuccess","ajaxSend"],function(t,e){Z.fn[e]=function(t){return this.on(e,t)}}),Z.expr.filters.animated=function(t){return Z.grep(Z.timers,function(e){return t===e.elem}).length};var Pe=t.document.documentElement;Z.offset={setOffset:function(t,e,n){var o,i,r,s,a,l,c,u=Z.css(t,"position"),d=Z(t),f={};"static"===u&&(t.style.position="relative"),a=d.offset(),r=Z.css(t,"top"),l=Z.css(t,"left"),c=("absolute"===u||"fixed"===u)&&(r+l).indexOf("auto")>-1,c?(o=d.position(),s=o.top,i=o.left):(s=parseFloat(r)||0,i=parseFloat(l)||0),Z.isFunction(e)&&(e=e.call(t,n,a)),null!=e.top&&(f.top=e.top-a.top+s),null!=e.left&&(f.left=e.left-a.left+i),"using"in e?e.using.call(t,f):d.css(f)}},Z.fn.extend({offset:function(t){if(arguments.length)return void 0===t?this:this.each(function(e){Z.offset.setOffset(this,t,e)});var e,n,o=this[0],i={top:0,left:0},r=o&&o.ownerDocument;return r?(e=r.documentElement,Z.contains(e,o)?(typeof o.getBoundingClientRect!==Et&&(i=o.getBoundingClientRect()),n=q(r),{top:i.top+n.pageYOffset-e.clientTop,left:i.left+n.pageXOffset-e.clientLeft}):i):void 0},position:function(){if(this[0]){var t,e,n=this[0],o={top:0,left:0};return"fixed"===Z.css(n,"position")?e=n.getBoundingClientRect():(t=this.offsetParent(),e=this.offset(),Z.nodeName(t[0],"html")||(o=t.offset()),o.top+=Z.css(t[0],"borderTopWidth",!0),o.left+=Z.css(t[0],"borderLeftWidth",!0)),{top:e.top-o.top-Z.css(n,"marginTop",!0),left:e.left-o.left-Z.css(n,"marginLeft",!0)}}},offsetParent:function(){return this.map(function(){for(var t=this.offsetParent||Pe;t&&!Z.nodeName(t,"html")&&"static"===Z.css(t,"position");)t=t.offsetParent;return t||Pe})}}),Z.each({scrollLeft:"pageXOffset",scrollTop:"pageYOffset"},function(e,n){var o="pageYOffset"===n;Z.fn[e]=function(i){return mt(this,function(e,i,r){var s=q(e);return void 0===r?s?s[n]:e[i]:void(s?s.scrollTo(o?t.pageXOffset:r,o?r:t.pageYOffset):e[i]=r)},e,i,arguments.length,null)}}),Z.each(["top","left"],function(t,e){Z.cssHooks[e]=A(J.pixelPosition,function(t,n){return n?(n=x(t,e),Xt.test(n)?Z(t).position()[e]+"px":n):void 0})}),Z.each({Height:"height",Width:"width"},function(t,e){Z.each({padding:"inner"+t,content:e,"":"outer"+t},function(n,o){Z.fn[o]=function(o,i){var r=arguments.length&&(n||"boolean"!=typeof o),s=n||(o===!0||i===!0?"margin":"border");return mt(this,function(e,n,o){var i;return Z.isWindow(e)?e.document.documentElement["client"+t]:9===e.nodeType?(i=e.documentElement,Math.max(e.body["scroll"+t],i["scroll"+t],e.body["offset"+t],i["offset"+t],i["client"+t])):void 0===o?Z.css(e,n,s):Z.style(e,n,o,s)},e,r?o:void 0,r,null)}})}),Z.fn.size=function(){return this.length},Z.fn.andSelf=Z.fn.addBack,"function"==typeof define&&define.amd&&define("jquery",[],function(){return Z});var Me=t.jQuery,Re=t.$;return Z.noConflict=function(e){return t.$===Z&&(t.$=Re),e&&t.jQuery===Z&&(t.jQuery=Me),Z},typeof e===Et&&(t.jQuery=t.$=Z),Z}),"undefined"==typeof jQuery)throw new Error("Bootstrap's JavaScript requires jQuery");+function(t){"use strict";var e=t.fn.jquery.split(" ")[0].split(".");if(e[0]<2&&e[1]<9||1==e[0]&&9==e[1]&&e[2]<1)throw new Error("Bootstrap's JavaScript requires jQuery version 1.9.1 or higher")}(jQuery),+function(t){"use strict";function e(){var t=document.createElement("bootstrap"),e={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(var n in e)if(void 0!==t.style[n])return{end:e[n]};return!1}t.fn.emulateTransitionEnd=function(e){var n=!1,o=this;t(this).one("bsTransitionEnd",function(){n=!0});var i=function(){n||t(o).trigger(t.support.transition.end)};return setTimeout(i,e),this},t(function(){t.support.transition=e(),t.support.transition&&(t.event.special.bsTransitionEnd={bindType:t.support.transition.end,delegateType:t.support.transition.end,handle:function(e){return t(e.target).is(this)?e.handleObj.handler.apply(this,arguments):void 0}})})}(jQuery),+function(t){"use strict";function e(e){return this.each(function(){var n=t(this),i=n.data("bs.alert");i||n.data("bs.alert",i=new o(this)),"string"==typeof e&&i[e].call(n)})}var n='[data-dismiss="alert"]',o=function(e){t(e).on("click",n,this.close)};o.VERSION="3.3.4",o.TRANSITION_DURATION=150,o.prototype.close=function(e){function n(){s.detach().trigger("closed.bs.alert").remove()}var i=t(this),r=i.attr("data-target");r||(r=i.attr("href"),r=r&&r.replace(/.*(?=#[^\s]*$)/,""));var s=t(r);e&&e.preventDefault(),s.length||(s=i.closest(".alert")),s.trigger(e=t.Event("close.bs.alert")),e.isDefaultPrevented()||(s.removeClass("in"),t.support.transition&&s.hasClass("fade")?s.one("bsTransitionEnd",n).emulateTransitionEnd(o.TRANSITION_DURATION):n())};var i=t.fn.alert;t.fn.alert=e,t.fn.alert.Constructor=o,t.fn.alert.noConflict=function(){return t.fn.alert=i,this},t(document).on("click.bs.alert.data-api",n,o.prototype.close)}(jQuery),+function(t){"use strict";function e(e){return this.each(function(){var o=t(this),i=o.data("bs.button"),r="object"==typeof e&&e;i||o.data("bs.button",i=new n(this,r)),"toggle"==e?i.toggle():e&&i.setState(e)})}var n=function(e,o){this.$element=t(e),this.options=t.extend({},n.DEFAULTS,o),this.isLoading=!1};n.VERSION="3.3.4",n.DEFAULTS={loadingText:"loading..."},n.prototype.setState=function(e){
var n="disabled",o=this.$element,i=o.is("input")?"val":"html",r=o.data();e+="Text",null==r.resetText&&o.data("resetText",o[i]()),setTimeout(t.proxy(function(){o[i](null==r[e]?this.options[e]:r[e]),"loadingText"==e?(this.isLoading=!0,o.addClass(n).attr(n,n)):this.isLoading&&(this.isLoading=!1,o.removeClass(n).removeAttr(n))},this),0)},n.prototype.toggle=function(){var t=!0,e=this.$element.closest('[data-toggle="buttons"]');if(e.length){var n=this.$element.find("input");"radio"==n.prop("type")&&(n.prop("checked")&&this.$element.hasClass("active")?t=!1:e.find(".active").removeClass("active")),t&&n.prop("checked",!this.$element.hasClass("active")).trigger("change")}else this.$element.attr("aria-pressed",!this.$element.hasClass("active"));t&&this.$element.toggleClass("active")};var o=t.fn.button;t.fn.button=e,t.fn.button.Constructor=n,t.fn.button.noConflict=function(){return t.fn.button=o,this},t(document).on("click.bs.button.data-api",'[data-toggle^="button"]',function(n){var o=t(n.target);o.hasClass("btn")||(o=o.closest(".btn")),e.call(o,"toggle"),n.preventDefault()}).on("focus.bs.button.data-api blur.bs.button.data-api",'[data-toggle^="button"]',function(e){t(e.target).closest(".btn").toggleClass("focus",/^focus(in)?$/.test(e.type))})}(jQuery),+function(t){"use strict";function e(e){return this.each(function(){var o=t(this),i=o.data("bs.carousel"),r=t.extend({},n.DEFAULTS,o.data(),"object"==typeof e&&e),s="string"==typeof e?e:r.slide;i||o.data("bs.carousel",i=new n(this,r)),"number"==typeof e?i.to(e):s?i[s]():r.interval&&i.pause().cycle()})}var n=function(e,n){this.$element=t(e),this.$indicators=this.$element.find(".carousel-indicators"),this.options=n,this.paused=null,this.sliding=null,this.interval=null,this.$active=null,this.$items=null,this.options.keyboard&&this.$element.on("keydown.bs.carousel",t.proxy(this.keydown,this)),"hover"==this.options.pause&&!("ontouchstart"in document.documentElement)&&this.$element.on("mouseenter.bs.carousel",t.proxy(this.pause,this)).on("mouseleave.bs.carousel",t.proxy(this.cycle,this))};n.VERSION="3.3.4",n.TRANSITION_DURATION=600,n.DEFAULTS={interval:5e3,pause:"hover",wrap:!0,keyboard:!0},n.prototype.keydown=function(t){if(!/input|textarea/i.test(t.target.tagName)){switch(t.which){case 37:this.prev();break;case 39:this.next();break;default:return}t.preventDefault()}},n.prototype.cycle=function(e){return e||(this.paused=!1),this.interval&&clearInterval(this.interval),this.options.interval&&!this.paused&&(this.interval=setInterval(t.proxy(this.next,this),this.options.interval)),this},n.prototype.getItemIndex=function(t){return this.$items=t.parent().children(".item"),this.$items.index(t||this.$active)},n.prototype.getItemForDirection=function(t,e){var n=this.getItemIndex(e),o="prev"==t&&0===n||"next"==t&&n==this.$items.length-1;if(o&&!this.options.wrap)return e;var i="prev"==t?-1:1,r=(n+i)%this.$items.length;return this.$items.eq(r)},n.prototype.to=function(t){var e=this,n=this.getItemIndex(this.$active=this.$element.find(".item.active"));return t>this.$items.length-1||0>t?void 0:this.sliding?this.$element.one("slid.bs.carousel",function(){e.to(t)}):n==t?this.pause().cycle():this.slide(t>n?"next":"prev",this.$items.eq(t))},n.prototype.pause=function(e){return e||(this.paused=!0),this.$element.find(".next, .prev").length&&t.support.transition&&(this.$element.trigger(t.support.transition.end),this.cycle(!0)),this.interval=clearInterval(this.interval),this},n.prototype.next=function(){return this.sliding?void 0:this.slide("next")},n.prototype.prev=function(){return this.sliding?void 0:this.slide("prev")},n.prototype.slide=function(e,o){var i=this.$element.find(".item.active"),r=o||this.getItemForDirection(e,i),s=this.interval,a="next"==e?"left":"right",l=this;if(r.hasClass("active"))return this.sliding=!1;var c=r[0],u=t.Event("slide.bs.carousel",{relatedTarget:c,direction:a});if(this.$element.trigger(u),!u.isDefaultPrevented()){if(this.sliding=!0,s&&this.pause(),this.$indicators.length){this.$indicators.find(".active").removeClass("active");var d=t(this.$indicators.children()[this.getItemIndex(r)]);d&&d.addClass("active")}var f=t.Event("slid.bs.carousel",{relatedTarget:c,direction:a});return t.support.transition&&this.$element.hasClass("slide")?(r.addClass(e),r[0].offsetWidth,i.addClass(a),r.addClass(a),i.one("bsTransitionEnd",function(){r.removeClass([e,a].join(" ")).addClass("active"),i.removeClass(["active",a].join(" ")),l.sliding=!1,setTimeout(function(){l.$element.trigger(f)},0)}).emulateTransitionEnd(n.TRANSITION_DURATION)):(i.removeClass("active"),r.addClass("active"),this.sliding=!1,this.$element.trigger(f)),s&&this.cycle(),this}};var o=t.fn.carousel;t.fn.carousel=e,t.fn.carousel.Constructor=n,t.fn.carousel.noConflict=function(){return t.fn.carousel=o,this};var i=function(n){var o,i=t(this),r=t(i.attr("data-target")||(o=i.attr("href"))&&o.replace(/.*(?=#[^\s]+$)/,""));if(r.hasClass("carousel")){var s=t.extend({},r.data(),i.data()),a=i.attr("data-slide-to");a&&(s.interval=!1),e.call(r,s),a&&r.data("bs.carousel").to(a),n.preventDefault()}};t(document).on("click.bs.carousel.data-api","[data-slide]",i).on("click.bs.carousel.data-api","[data-slide-to]",i),t(window).on("load",function(){t('[data-ride="carousel"]').each(function(){var n=t(this);e.call(n,n.data())})})}(jQuery),+function(t){"use strict";function e(e){var n,o=e.attr("data-target")||(n=e.attr("href"))&&n.replace(/.*(?=#[^\s]+$)/,"");return t(o)}function n(e){return this.each(function(){var n=t(this),i=n.data("bs.collapse"),r=t.extend({},o.DEFAULTS,n.data(),"object"==typeof e&&e);!i&&r.toggle&&/show|hide/.test(e)&&(r.toggle=!1),i||n.data("bs.collapse",i=new o(this,r)),"string"==typeof e&&i[e]()})}var o=function(e,n){this.$element=t(e),this.options=t.extend({},o.DEFAULTS,n),this.$trigger=t('[data-toggle="collapse"][href="#'+e.id+'"],[data-toggle="collapse"][data-target="#'+e.id+'"]'),this.transitioning=null,this.options.parent?this.$parent=this.getParent():this.addAriaAndCollapsedClass(this.$element,this.$trigger),this.options.toggle&&this.toggle()};o.VERSION="3.3.4",o.TRANSITION_DURATION=350,o.DEFAULTS={toggle:!0},o.prototype.dimension=function(){var t=this.$element.hasClass("width");return t?"width":"height"},o.prototype.show=function(){if(!this.transitioning&&!this.$element.hasClass("in")){var e,i=this.$parent&&this.$parent.children(".panel").children(".in, .collapsing");if(!(i&&i.length&&(e=i.data("bs.collapse"),e&&e.transitioning))){var r=t.Event("show.bs.collapse");if(this.$element.trigger(r),!r.isDefaultPrevented()){i&&i.length&&(n.call(i,"hide"),e||i.data("bs.collapse",null));var s=this.dimension();this.$element.removeClass("collapse").addClass("collapsing")[s](0).attr("aria-expanded",!0),this.$trigger.removeClass("collapsed").attr("aria-expanded",!0),this.transitioning=1;var a=function(){this.$element.removeClass("collapsing").addClass("collapse in")[s](""),this.transitioning=0,this.$element.trigger("shown.bs.collapse")};if(!t.support.transition)return a.call(this);var l=t.camelCase(["scroll",s].join("-"));this.$element.one("bsTransitionEnd",t.proxy(a,this)).emulateTransitionEnd(o.TRANSITION_DURATION)[s](this.$element[0][l])}}}},o.prototype.hide=function(){if(!this.transitioning&&this.$element.hasClass("in")){var e=t.Event("hide.bs.collapse");if(this.$element.trigger(e),!e.isDefaultPrevented()){var n=this.dimension();this.$element[n](this.$element[n]())[0].offsetHeight,this.$element.addClass("collapsing").removeClass("collapse in").attr("aria-expanded",!1),this.$trigger.addClass("collapsed").attr("aria-expanded",!1),this.transitioning=1;var i=function(){this.transitioning=0,this.$element.removeClass("collapsing").addClass("collapse").trigger("hidden.bs.collapse")};return t.support.transition?void this.$element[n](0).one("bsTransitionEnd",t.proxy(i,this)).emulateTransitionEnd(o.TRANSITION_DURATION):i.call(this)}}},o.prototype.toggle=function(){this[this.$element.hasClass("in")?"hide":"show"]()},o.prototype.getParent=function(){return t(this.options.parent).find('[data-toggle="collapse"][data-parent="'+this.options.parent+'"]').each(t.proxy(function(n,o){var i=t(o);this.addAriaAndCollapsedClass(e(i),i)},this)).end()},o.prototype.addAriaAndCollapsedClass=function(t,e){var n=t.hasClass("in");t.attr("aria-expanded",n),e.toggleClass("collapsed",!n).attr("aria-expanded",n)};var i=t.fn.collapse;t.fn.collapse=n,t.fn.collapse.Constructor=o,t.fn.collapse.noConflict=function(){return t.fn.collapse=i,this},t(document).on("click.bs.collapse.data-api",'[data-toggle="collapse"]',function(o){var i=t(this);i.attr("data-target")||o.preventDefault();var r=e(i),s=r.data("bs.collapse"),a=s?"toggle":i.data();n.call(r,a)})}(jQuery),+function(t){"use strict";function e(e){e&&3===e.which||(t(i).remove(),t(r).each(function(){var o=t(this),i=n(o),r={relatedTarget:this};i.hasClass("open")&&(i.trigger(e=t.Event("hide.bs.dropdown",r)),e.isDefaultPrevented()||(o.attr("aria-expanded","false"),i.removeClass("open").trigger("hidden.bs.dropdown",r)))}))}function n(e){var n=e.attr("data-target");n||(n=e.attr("href"),n=n&&/#[A-Za-z]/.test(n)&&n.replace(/.*(?=#[^\s]*$)/,""));var o=n&&t(n);return o&&o.length?o:e.parent()}function o(e){return this.each(function(){var n=t(this),o=n.data("bs.dropdown");o||n.data("bs.dropdown",o=new s(this)),"string"==typeof e&&o[e].call(n)})}var i=".dropdown-backdrop",r='[data-toggle="dropdown"]',s=function(e){t(e).on("click.bs.dropdown",this.toggle)};s.VERSION="3.3.4",s.prototype.toggle=function(o){var i=t(this);if(!i.is(".disabled, :disabled")){var r=n(i),s=r.hasClass("open");if(e(),!s){"ontouchstart"in document.documentElement&&!r.closest(".navbar-nav").length&&t('<div class="dropdown-backdrop"/>').insertAfter(t(this)).on("click",e);var a={relatedTarget:this};if(r.trigger(o=t.Event("show.bs.dropdown",a)),o.isDefaultPrevented())return;i.trigger("focus").attr("aria-expanded","true"),r.toggleClass("open").trigger("shown.bs.dropdown",a)}return!1}},s.prototype.keydown=function(e){if(/(38|40|27|32)/.test(e.which)&&!/input|textarea/i.test(e.target.tagName)){var o=t(this);if(e.preventDefault(),e.stopPropagation(),!o.is(".disabled, :disabled")){var i=n(o),s=i.hasClass("open");if(!s&&27!=e.which||s&&27==e.which)return 27==e.which&&i.find(r).trigger("focus"),o.trigger("click");var a=" li:not(.disabled):visible a",l=i.find('[role="menu"]'+a+', [role="listbox"]'+a);if(l.length){var c=l.index(e.target);38==e.which&&c>0&&c--,40==e.which&&c<l.length-1&&c++,~c||(c=0),l.eq(c).trigger("focus")}}}};var a=t.fn.dropdown;t.fn.dropdown=o,t.fn.dropdown.Constructor=s,t.fn.dropdown.noConflict=function(){return t.fn.dropdown=a,this},t(document).on("click.bs.dropdown.data-api",e).on("click.bs.dropdown.data-api",".dropdown form",function(t){t.stopPropagation()}).on("click.bs.dropdown.data-api",r,s.prototype.toggle).on("keydown.bs.dropdown.data-api",r,s.prototype.keydown).on("keydown.bs.dropdown.data-api",'[role="menu"]',s.prototype.keydown).on("keydown.bs.dropdown.data-api",'[role="listbox"]',s.prototype.keydown)}(jQuery),+function(t){"use strict";function e(e,o){return this.each(function(){var i=t(this),r=i.data("bs.modal"),s=t.extend({},n.DEFAULTS,i.data(),"object"==typeof e&&e);r||i.data("bs.modal",r=new n(this,s)),"string"==typeof e?r[e](o):s.show&&r.show(o)})}var n=function(e,n){this.options=n,this.$body=t(document.body),this.$element=t(e),this.$dialog=this.$element.find(".modal-dialog"),this.$backdrop=null,this.isShown=null,this.originalBodyPad=null,this.scrollbarWidth=0,this.ignoreBackdropClick=!1,this.options.remote&&this.$element.find(".modal-content").load(this.options.remote,t.proxy(function(){this.$element.trigger("loaded.bs.modal")},this))};n.VERSION="3.3.4",n.TRANSITION_DURATION=300,n.BACKDROP_TRANSITION_DURATION=150,n.DEFAULTS={backdrop:!0,keyboard:!0,show:!0},n.prototype.toggle=function(t){return this.isShown?this.hide():this.show(t)},n.prototype.show=function(e){var o=this,i=t.Event("show.bs.modal",{relatedTarget:e});this.$element.trigger(i),this.isShown||i.isDefaultPrevented()||(this.isShown=!0,this.checkScrollbar(),this.setScrollbar(),this.$body.addClass("modal-open"),this.escape(),this.resize(),this.$element.on("click.dismiss.bs.modal",'[data-dismiss="modal"]',t.proxy(this.hide,this)),this.$dialog.on("mousedown.dismiss.bs.modal",function(){o.$element.one("mouseup.dismiss.bs.modal",function(e){t(e.target).is(o.$element)&&(o.ignoreBackdropClick=!0)})}),this.backdrop(function(){var i=t.support.transition&&o.$element.hasClass("fade");o.$element.parent().length||o.$element.appendTo(o.$body),o.$element.show().scrollTop(0),o.adjustDialog(),i&&o.$element[0].offsetWidth,o.$element.addClass("in").attr("aria-hidden",!1),o.enforceFocus();var r=t.Event("shown.bs.modal",{relatedTarget:e});i?o.$dialog.one("bsTransitionEnd",function(){o.$element.trigger("focus").trigger(r)}).emulateTransitionEnd(n.TRANSITION_DURATION):o.$element.trigger("focus").trigger(r)}))},n.prototype.hide=function(e){e&&e.preventDefault(),e=t.Event("hide.bs.modal"),this.$element.trigger(e),this.isShown&&!e.isDefaultPrevented()&&(this.isShown=!1,this.escape(),this.resize(),t(document).off("focusin.bs.modal"),this.$element.removeClass("in").attr("aria-hidden",!0).off("click.dismiss.bs.modal").off("mouseup.dismiss.bs.modal"),this.$dialog.off("mousedown.dismiss.bs.modal"),t.support.transition&&this.$element.hasClass("fade")?this.$element.one("bsTransitionEnd",t.proxy(this.hideModal,this)).emulateTransitionEnd(n.TRANSITION_DURATION):this.hideModal())},n.prototype.enforceFocus=function(){t(document).off("focusin.bs.modal").on("focusin.bs.modal",t.proxy(function(t){this.$element[0]===t.target||this.$element.has(t.target).length||this.$element.trigger("focus")},this))},n.prototype.escape=function(){this.isShown&&this.options.keyboard?this.$element.on("keydown.dismiss.bs.modal",t.proxy(function(t){27==t.which&&this.hide()},this)):this.isShown||this.$element.off("keydown.dismiss.bs.modal")},n.prototype.resize=function(){this.isShown?t(window).on("resize.bs.modal",t.proxy(this.handleUpdate,this)):t(window).off("resize.bs.modal")},n.prototype.hideModal=function(){var t=this;this.$element.hide(),this.backdrop(function(){t.$body.removeClass("modal-open"),t.resetAdjustments(),t.resetScrollbar(),t.$element.trigger("hidden.bs.modal")})},n.prototype.removeBackdrop=function(){this.$backdrop&&this.$backdrop.remove(),this.$backdrop=null},n.prototype.backdrop=function(e){var o=this,i=this.$element.hasClass("fade")?"fade":"";if(this.isShown&&this.options.backdrop){var r=t.support.transition&&i;if(this.$backdrop=t('<div class="modal-backdrop '+i+'" />').appendTo(this.$body),this.$element.on("click.dismiss.bs.modal",t.proxy(function(t){return this.ignoreBackdropClick?void(this.ignoreBackdropClick=!1):void(t.target===t.currentTarget&&("static"==this.options.backdrop?this.$element[0].focus():this.hide()))},this)),r&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in"),!e)return;r?this.$backdrop.one("bsTransitionEnd",e).emulateTransitionEnd(n.BACKDROP_TRANSITION_DURATION):e()}else if(!this.isShown&&this.$backdrop){this.$backdrop.removeClass("in");var s=function(){o.removeBackdrop(),e&&e()};t.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one("bsTransitionEnd",s).emulateTransitionEnd(n.BACKDROP_TRANSITION_DURATION):s()}else e&&e()},n.prototype.handleUpdate=function(){this.adjustDialog()},n.prototype.adjustDialog=function(){var t=this.$element[0].scrollHeight>document.documentElement.clientHeight;this.$element.css({paddingLeft:!this.bodyIsOverflowing&&t?this.scrollbarWidth:"",paddingRight:this.bodyIsOverflowing&&!t?this.scrollbarWidth:""})},n.prototype.resetAdjustments=function(){this.$element.css({paddingLeft:"",paddingRight:""})},n.prototype.checkScrollbar=function(){var t=window.innerWidth;if(!t){var e=document.documentElement.getBoundingClientRect();t=e.right-Math.abs(e.left)}this.bodyIsOverflowing=document.body.clientWidth<t,this.scrollbarWidth=this.measureScrollbar()},n.prototype.setScrollbar=function(){var t=parseInt(this.$body.css("padding-right")||0,10);this.originalBodyPad=document.body.style.paddingRight||"",this.bodyIsOverflowing&&this.$body.css("padding-right",t+this.scrollbarWidth)},n.prototype.resetScrollbar=function(){this.$body.css("padding-right",this.originalBodyPad)},n.prototype.measureScrollbar=function(){var t=document.createElement("div");t.className="modal-scrollbar-measure",this.$body.append(t);var e=t.offsetWidth-t.clientWidth;return this.$body[0].removeChild(t),e};var o=t.fn.modal;t.fn.modal=e,t.fn.modal.Constructor=n,t.fn.modal.noConflict=function(){return t.fn.modal=o,this},t(document).on("click.bs.modal.data-api",'[data-toggle="modal"]',function(n){var o=t(this),i=o.attr("href"),r=t(o.attr("data-target")||i&&i.replace(/.*(?=#[^\s]+$)/,"")),s=r.data("bs.modal")?"toggle":t.extend({remote:!/#/.test(i)&&i},r.data(),o.data());o.is("a")&&n.preventDefault(),r.one("show.bs.modal",function(t){t.isDefaultPrevented()||r.one("hidden.bs.modal",function(){o.is(":visible")&&o.trigger("focus")})}),e.call(r,s,this)})}(jQuery),+function(t){"use strict";function e(e){return this.each(function(){var o=t(this),i=o.data("bs.tooltip"),r="object"==typeof e&&e;(i||!/destroy|hide/.test(e))&&(i||o.data("bs.tooltip",i=new n(this,r)),"string"==typeof e&&i[e]())})}var n=function(t,e){this.type=null,this.options=null,this.enabled=null,this.timeout=null,this.hoverState=null,this.$element=null,this.init("tooltip",t,e)};n.VERSION="3.3.4",n.TRANSITION_DURATION=150,n.DEFAULTS={animation:!0,placement:"top",selector:!1,template:'<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',trigger:"hover focus",title:"",delay:0,html:!1,container:!1,viewport:{selector:"body",padding:0}},n.prototype.init=function(e,n,o){if(this.enabled=!0,this.type=e,this.$element=t(n),this.options=this.getOptions(o),this.$viewport=this.options.viewport&&t(this.options.viewport.selector||this.options.viewport),this.$element[0]instanceof document.constructor&&!this.options.selector)throw new Error("`selector` option must be specified when initializing "+this.type+" on the window.document object!");for(var i=this.options.trigger.split(" "),r=i.length;r--;){var s=i[r];if("click"==s)this.$element.on("click."+this.type,this.options.selector,t.proxy(this.toggle,this));else if("manual"!=s){var a="hover"==s?"mouseenter":"focusin",l="hover"==s?"mouseleave":"focusout";this.$element.on(a+"."+this.type,this.options.selector,t.proxy(this.enter,this)),this.$element.on(l+"."+this.type,this.options.selector,t.proxy(this.leave,this))}}this.options.selector?this._options=t.extend({},this.options,{trigger:"manual",selector:""}):this.fixTitle()},n.prototype.getDefaults=function(){return n.DEFAULTS},n.prototype.getOptions=function(e){return e=t.extend({},this.getDefaults(),this.$element.data(),e),e.delay&&"number"==typeof e.delay&&(e.delay={show:e.delay,hide:e.delay}),e},n.prototype.getDelegateOptions=function(){var e={},n=this.getDefaults();return this._options&&t.each(this._options,function(t,o){n[t]!=o&&(e[t]=o)}),e},n.prototype.enter=function(e){var n=e instanceof this.constructor?e:t(e.currentTarget).data("bs."+this.type);return n&&n.$tip&&n.$tip.is(":visible")?void(n.hoverState="in"):(n||(n=new this.constructor(e.currentTarget,this.getDelegateOptions()),t(e.currentTarget).data("bs."+this.type,n)),clearTimeout(n.timeout),n.hoverState="in",n.options.delay&&n.options.delay.show?void(n.timeout=setTimeout(function(){"in"==n.hoverState&&n.show()},n.options.delay.show)):n.show())},n.prototype.leave=function(e){var n=e instanceof this.constructor?e:t(e.currentTarget).data("bs."+this.type);return n||(n=new this.constructor(e.currentTarget,this.getDelegateOptions()),t(e.currentTarget).data("bs."+this.type,n)),clearTimeout(n.timeout),n.hoverState="out",n.options.delay&&n.options.delay.hide?void(n.timeout=setTimeout(function(){"out"==n.hoverState&&n.hide()},n.options.delay.hide)):n.hide()},n.prototype.show=function(){var e=t.Event("show.bs."+this.type);if(this.hasContent()&&this.enabled){this.$element.trigger(e);var o=t.contains(this.$element[0].ownerDocument.documentElement,this.$element[0]);if(e.isDefaultPrevented()||!o)return;var i=this,r=this.tip(),s=this.getUID(this.type);this.setContent(),r.attr("id",s),this.$element.attr("aria-describedby",s),this.options.animation&&r.addClass("fade");var a="function"==typeof this.options.placement?this.options.placement.call(this,r[0],this.$element[0]):this.options.placement,l=/\s?auto?\s?/i,c=l.test(a);c&&(a=a.replace(l,"")||"top"),r.detach().css({top:0,left:0,display:"block"}).addClass(a).data("bs."+this.type,this),this.options.container?r.appendTo(this.options.container):r.insertAfter(this.$element);var u=this.getPosition(),d=r[0].offsetWidth,f=r[0].offsetHeight;if(c){var p=a,h=this.options.container?t(this.options.container):this.$element.parent(),g=this.getPosition(h);a="bottom"==a&&u.bottom+f>g.bottom?"top":"top"==a&&u.top-f<g.top?"bottom":"right"==a&&u.right+d>g.width?"left":"left"==a&&u.left-d<g.left?"right":a,r.removeClass(p).addClass(a)}var m=this.getCalculatedOffset(a,u,d,f);this.applyPlacement(m,a);var v=function(){var t=i.hoverState;i.$element.trigger("shown.bs."+i.type),i.hoverState=null,"out"==t&&i.leave(i)};t.support.transition&&this.$tip.hasClass("fade")?r.one("bsTransitionEnd",v).emulateTransitionEnd(n.TRANSITION_DURATION):v()}},n.prototype.applyPlacement=function(e,n){var o=this.tip(),i=o[0].offsetWidth,r=o[0].offsetHeight,s=parseInt(o.css("margin-top"),10),a=parseInt(o.css("margin-left"),10);isNaN(s)&&(s=0),isNaN(a)&&(a=0),e.top=e.top+s,e.left=e.left+a,t.offset.setOffset(o[0],t.extend({using:function(t){o.css({top:Math.round(t.top),left:Math.round(t.left)})}},e),0),o.addClass("in");var l=o[0].offsetWidth,c=o[0].offsetHeight;"top"==n&&c!=r&&(e.top=e.top+r-c);var u=this.getViewportAdjustedDelta(n,e,l,c);u.left?e.left+=u.left:e.top+=u.top;var d=/top|bottom/.test(n),f=d?2*u.left-i+l:2*u.top-r+c,p=d?"offsetWidth":"offsetHeight";o.offset(e),this.replaceArrow(f,o[0][p],d)},n.prototype.replaceArrow=function(t,e,n){this.arrow().css(n?"left":"top",50*(1-t/e)+"%").css(n?"top":"left","")},n.prototype.setContent=function(){var t=this.tip(),e=this.getTitle();t.find(".tooltip-inner")[this.options.html?"html":"text"](e),t.removeClass("fade in top bottom left right")},n.prototype.hide=function(e){function o(){"in"!=i.hoverState&&r.detach(),i.$element.removeAttr("aria-describedby").trigger("hidden.bs."+i.type),e&&e()}var i=this,r=t(this.$tip),s=t.Event("hide.bs."+this.type);return this.$element.trigger(s),s.isDefaultPrevented()?void 0:(r.removeClass("in"),t.support.transition&&r.hasClass("fade")?r.one("bsTransitionEnd",o).emulateTransitionEnd(n.TRANSITION_DURATION):o(),this.hoverState=null,this)},n.prototype.fixTitle=function(){var t=this.$element;(t.attr("title")||"string"!=typeof t.attr("data-original-title"))&&t.attr("data-original-title",t.attr("title")||"").attr("title","")},n.prototype.hasContent=function(){return this.getTitle()},n.prototype.getPosition=function(e){e=e||this.$element;var n=e[0],o="BODY"==n.tagName,i=n.getBoundingClientRect();null==i.width&&(i=t.extend({},i,{width:i.right-i.left,height:i.bottom-i.top}));var r=o?{top:0,left:0}:e.offset(),s={scroll:o?document.documentElement.scrollTop||document.body.scrollTop:e.scrollTop()},a=o?{width:t(window).width(),height:t(window).height()}:null;return t.extend({},i,s,a,r)},n.prototype.getCalculatedOffset=function(t,e,n,o){return"bottom"==t?{top:e.top+e.height,left:e.left+e.width/2-n/2}:"top"==t?{top:e.top-o,left:e.left+e.width/2-n/2}:"left"==t?{top:e.top+e.height/2-o/2,left:e.left-n}:{top:e.top+e.height/2-o/2,left:e.left+e.width}},n.prototype.getViewportAdjustedDelta=function(t,e,n,o){var i={top:0,left:0};if(!this.$viewport)return i;var r=this.options.viewport&&this.options.viewport.padding||0,s=this.getPosition(this.$viewport);if(/right|left/.test(t)){var a=e.top-r-s.scroll,l=e.top+r-s.scroll+o;a<s.top?i.top=s.top-a:l>s.top+s.height&&(i.top=s.top+s.height-l)}else{var c=e.left-r,u=e.left+r+n;c<s.left?i.left=s.left-c:u>s.width&&(i.left=s.left+s.width-u)}return i},n.prototype.getTitle=function(){var t,e=this.$element,n=this.options;return t=e.attr("data-original-title")||("function"==typeof n.title?n.title.call(e[0]):n.title)},n.prototype.getUID=function(t){do t+=~~(1e6*Math.random());while(document.getElementById(t));return t},n.prototype.tip=function(){return this.$tip=this.$tip||t(this.options.template)},n.prototype.arrow=function(){return this.$arrow=this.$arrow||this.tip().find(".tooltip-arrow")},n.prototype.enable=function(){this.enabled=!0},n.prototype.disable=function(){this.enabled=!1},n.prototype.toggleEnabled=function(){this.enabled=!this.enabled},n.prototype.toggle=function(e){var n=this;e&&(n=t(e.currentTarget).data("bs."+this.type),n||(n=new this.constructor(e.currentTarget,this.getDelegateOptions()),t(e.currentTarget).data("bs."+this.type,n))),n.tip().hasClass("in")?n.leave(n):n.enter(n)},n.prototype.destroy=function(){var t=this;clearTimeout(this.timeout),this.hide(function(){t.$element.off("."+t.type).removeData("bs."+t.type)})};var o=t.fn.tooltip;t.fn.tooltip=e,t.fn.tooltip.Constructor=n,t.fn.tooltip.noConflict=function(){return t.fn.tooltip=o,this}}(jQuery),+function(t){"use strict";function e(e){return this.each(function(){var o=t(this),i=o.data("bs.popover"),r="object"==typeof e&&e;(i||!/destroy|hide/.test(e))&&(i||o.data("bs.popover",i=new n(this,r)),"string"==typeof e&&i[e]())})}var n=function(t,e){this.init("popover",t,e)};if(!t.fn.tooltip)throw new Error("Popover requires tooltip.js");n.VERSION="3.3.4",n.DEFAULTS=t.extend({},t.fn.tooltip.Constructor.DEFAULTS,{placement:"right",trigger:"click",content:"",template:'<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'}),n.prototype=t.extend({},t.fn.tooltip.Constructor.prototype),n.prototype.constructor=n,n.prototype.getDefaults=function(){return n.DEFAULTS},n.prototype.setContent=function(){var t=this.tip(),e=this.getTitle(),n=this.getContent();t.find(".popover-title")[this.options.html?"html":"text"](e),t.find(".popover-content").children().detach().end()[this.options.html?"string"==typeof n?"html":"append":"text"](n),t.removeClass("fade top bottom left right in"),t.find(".popover-title").html()||t.find(".popover-title").hide()},n.prototype.hasContent=function(){return this.getTitle()||this.getContent()},n.prototype.getContent=function(){var t=this.$element,e=this.options;return t.attr("data-content")||("function"==typeof e.content?e.content.call(t[0]):e.content)},n.prototype.arrow=function(){return this.$arrow=this.$arrow||this.tip().find(".arrow")};var o=t.fn.popover;t.fn.popover=e,t.fn.popover.Constructor=n,t.fn.popover.noConflict=function(){return t.fn.popover=o,this}}(jQuery),+function(t){"use strict";function e(n,o){this.$body=t(document.body),this.$scrollElement=t(t(n).is(document.body)?window:n),this.options=t.extend({},e.DEFAULTS,o),this.selector=(this.options.target||"")+" .nav li > a",this.offsets=[],this.targets=[],this.activeTarget=null,this.scrollHeight=0,this.$scrollElement.on("scroll.bs.scrollspy",t.proxy(this.process,this)),this.refresh(),this.process()}function n(n){return this.each(function(){var o=t(this),i=o.data("bs.scrollspy"),r="object"==typeof n&&n;i||o.data("bs.scrollspy",i=new e(this,r)),"string"==typeof n&&i[n]()})}e.VERSION="3.3.4",e.DEFAULTS={offset:10},e.prototype.getScrollHeight=function(){return this.$scrollElement[0].scrollHeight||Math.max(this.$body[0].scrollHeight,document.documentElement.scrollHeight)},e.prototype.refresh=function(){var e=this,n="offset",o=0;this.offsets=[],this.targets=[],this.scrollHeight=this.getScrollHeight(),t.isWindow(this.$scrollElement[0])||(n="position",o=this.$scrollElement.scrollTop()),this.$body.find(this.selector).map(function(){var e=t(this),i=e.data("target")||e.attr("href"),r=/^#./.test(i)&&t(i);return r&&r.length&&r.is(":visible")&&[[r[n]().top+o,i]]||null}).sort(function(t,e){return t[0]-e[0]}).each(function(){e.offsets.push(this[0]),e.targets.push(this[1])})},e.prototype.process=function(){var t,e=this.$scrollElement.scrollTop()+this.options.offset,n=this.getScrollHeight(),o=this.options.offset+n-this.$scrollElement.height(),i=this.offsets,r=this.targets,s=this.activeTarget;if(this.scrollHeight!=n&&this.refresh(),e>=o)return s!=(t=r[r.length-1])&&this.activate(t);if(s&&e<i[0])return this.activeTarget=null,this.clear();for(t=i.length;t--;)s!=r[t]&&e>=i[t]&&(void 0===i[t+1]||e<i[t+1])&&this.activate(r[t])},e.prototype.activate=function(e){this.activeTarget=e,this.clear();var n=this.selector+'[data-target="'+e+'"],'+this.selector+'[href="'+e+'"]',o=t(n).parents("li").addClass("active");o.parent(".dropdown-menu").length&&(o=o.closest("li.dropdown").addClass("active")),o.trigger("activate.bs.scrollspy")},e.prototype.clear=function(){t(this.selector).parentsUntil(this.options.target,".active").removeClass("active")};var o=t.fn.scrollspy;t.fn.scrollspy=n,t.fn.scrollspy.Constructor=e,t.fn.scrollspy.noConflict=function(){return t.fn.scrollspy=o,this},t(window).on("load.bs.scrollspy.data-api",function(){t('[data-spy="scroll"]').each(function(){var e=t(this);n.call(e,e.data())})})}(jQuery),+function(t){"use strict";function e(e){return this.each(function(){var o=t(this),i=o.data("bs.tab");i||o.data("bs.tab",i=new n(this)),"string"==typeof e&&i[e]()})}var n=function(e){this.element=t(e)};n.VERSION="3.3.4",n.TRANSITION_DURATION=150,n.prototype.show=function(){var e=this.element,n=e.closest("ul:not(.dropdown-menu)"),o=e.data("target");if(o||(o=e.attr("href"),o=o&&o.replace(/.*(?=#[^\s]*$)/,"")),!e.parent("li").hasClass("active")){var i=n.find(".active:last a"),r=t.Event("hide.bs.tab",{relatedTarget:e[0]}),s=t.Event("show.bs.tab",{relatedTarget:i[0]});if(i.trigger(r),e.trigger(s),!s.isDefaultPrevented()&&!r.isDefaultPrevented()){var a=t(o);this.activate(e.closest("li"),n),this.activate(a,a.parent(),function(){i.trigger({type:"hidden.bs.tab",relatedTarget:e[0]}),e.trigger({type:"shown.bs.tab",relatedTarget:i[0]})})}}},n.prototype.activate=function(e,o,i){function r(){s.removeClass("active").find("> .dropdown-menu > .active").removeClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded",!1),e.addClass("active").find('[data-toggle="tab"]').attr("aria-expanded",!0),a?(e[0].offsetWidth,e.addClass("in")):e.removeClass("fade"),e.parent(".dropdown-menu").length&&e.closest("li.dropdown").addClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded",!0),i&&i()}var s=o.find("> .active"),a=i&&t.support.transition&&(s.length&&s.hasClass("fade")||!!o.find("> .fade").length);s.length&&a?s.one("bsTransitionEnd",r).emulateTransitionEnd(n.TRANSITION_DURATION):r(),s.removeClass("in")};var o=t.fn.tab;t.fn.tab=e,t.fn.tab.Constructor=n,t.fn.tab.noConflict=function(){return t.fn.tab=o,this};var i=function(n){n.preventDefault(),e.call(t(this),"show")};t(document).on("click.bs.tab.data-api",'[data-toggle="tab"]',i).on("click.bs.tab.data-api",'[data-toggle="pill"]',i)}(jQuery),+function(t){"use strict";function e(e){return this.each(function(){var o=t(this),i=o.data("bs.affix"),r="object"==typeof e&&e;i||o.data("bs.affix",i=new n(this,r)),"string"==typeof e&&i[e]()})}var n=function(e,o){this.options=t.extend({},n.DEFAULTS,o),this.$target=t(this.options.target).on("scroll.bs.affix.data-api",t.proxy(this.checkPosition,this)).on("click.bs.affix.data-api",t.proxy(this.checkPositionWithEventLoop,this)),this.$element=t(e),this.affixed=null,this.unpin=null,this.pinnedOffset=null,this.checkPosition()};n.VERSION="3.3.4",n.RESET="affix affix-top affix-bottom",n.DEFAULTS={offset:0,target:window},n.prototype.getState=function(t,e,n,o){var i=this.$target.scrollTop(),r=this.$element.offset(),s=this.$target.height();if(null!=n&&"top"==this.affixed)return n>i?"top":!1;if("bottom"==this.affixed)return null!=n?i+this.unpin<=r.top?!1:"bottom":t-o>=i+s?!1:"bottom";var a=null==this.affixed,l=a?i:r.top,c=a?s:e;return null!=n&&n>=i?"top":null!=o&&l+c>=t-o?"bottom":!1;
},n.prototype.getPinnedOffset=function(){if(this.pinnedOffset)return this.pinnedOffset;this.$element.removeClass(n.RESET).addClass("affix");var t=this.$target.scrollTop(),e=this.$element.offset();return this.pinnedOffset=e.top-t},n.prototype.checkPositionWithEventLoop=function(){setTimeout(t.proxy(this.checkPosition,this),1)},n.prototype.checkPosition=function(){if(this.$element.is(":visible")){var e=this.$element.height(),o=this.options.offset,i=o.top,r=o.bottom,s=t(document.body).height();"object"!=typeof o&&(r=i=o),"function"==typeof i&&(i=o.top(this.$element)),"function"==typeof r&&(r=o.bottom(this.$element));var a=this.getState(s,e,i,r);if(this.affixed!=a){null!=this.unpin&&this.$element.css("top","");var l="affix"+(a?"-"+a:""),c=t.Event(l+".bs.affix");if(this.$element.trigger(c),c.isDefaultPrevented())return;this.affixed=a,this.unpin="bottom"==a?this.getPinnedOffset():null,this.$element.removeClass(n.RESET).addClass(l).trigger(l.replace("affix","affixed")+".bs.affix")}"bottom"==a&&this.$element.offset({top:s-e-r})}};var o=t.fn.affix;t.fn.affix=e,t.fn.affix.Constructor=n,t.fn.affix.noConflict=function(){return t.fn.affix=o,this},t(window).on("load",function(){t('[data-spy="affix"]').each(function(){var n=t(this),o=n.data();o.offset=o.offset||{},null!=o.offsetBottom&&(o.offset.bottom=o.offsetBottom),null!=o.offsetTop&&(o.offset.top=o.offsetTop),e.call(n,o)})})}(jQuery),jQuery.easing.jswing=jQuery.easing.swing,jQuery.extend(jQuery.easing,{def:"easeOutQuad",swing:function(t,e,n,o,i){return jQuery.easing[jQuery.easing.def](t,e,n,o,i)},easeInQuad:function(t,e,n,o,i){return o*(e/=i)*e+n},easeOutQuad:function(t,e,n,o,i){return-o*(e/=i)*(e-2)+n},easeInOutQuad:function(t,e,n,o,i){return(e/=i/2)<1?o/2*e*e+n:-o/2*(--e*(e-2)-1)+n},easeInCubic:function(t,e,n,o,i){return o*(e/=i)*e*e+n},easeOutCubic:function(t,e,n,o,i){return o*((e=e/i-1)*e*e+1)+n},easeInOutCubic:function(t,e,n,o,i){return(e/=i/2)<1?o/2*e*e*e+n:o/2*((e-=2)*e*e+2)+n},easeInQuart:function(t,e,n,o,i){return o*(e/=i)*e*e*e+n},easeOutQuart:function(t,e,n,o,i){return-o*((e=e/i-1)*e*e*e-1)+n},easeInOutQuart:function(t,e,n,o,i){return(e/=i/2)<1?o/2*e*e*e*e+n:-o/2*((e-=2)*e*e*e-2)+n},easeInQuint:function(t,e,n,o,i){return o*(e/=i)*e*e*e*e+n},easeOutQuint:function(t,e,n,o,i){return o*((e=e/i-1)*e*e*e*e+1)+n},easeInOutQuint:function(t,e,n,o,i){return(e/=i/2)<1?o/2*e*e*e*e*e+n:o/2*((e-=2)*e*e*e*e+2)+n},easeInSine:function(t,e,n,o,i){return-o*Math.cos(e/i*(Math.PI/2))+o+n},easeOutSine:function(t,e,n,o,i){return o*Math.sin(e/i*(Math.PI/2))+n},easeInOutSine:function(t,e,n,o,i){return-o/2*(Math.cos(Math.PI*e/i)-1)+n},easeInExpo:function(t,e,n,o,i){return 0==e?n:o*Math.pow(2,10*(e/i-1))+n},easeOutExpo:function(t,e,n,o,i){return e==i?n+o:o*(-Math.pow(2,-10*e/i)+1)+n},easeInOutExpo:function(t,e,n,o,i){return 0==e?n:e==i?n+o:(e/=i/2)<1?o/2*Math.pow(2,10*(e-1))+n:o/2*(-Math.pow(2,-10*--e)+2)+n},easeInCirc:function(t,e,n,o,i){return-o*(Math.sqrt(1-(e/=i)*e)-1)+n},easeOutCirc:function(t,e,n,o,i){return o*Math.sqrt(1-(e=e/i-1)*e)+n},easeInOutCirc:function(t,e,n,o,i){return(e/=i/2)<1?-o/2*(Math.sqrt(1-e*e)-1)+n:o/2*(Math.sqrt(1-(e-=2)*e)+1)+n},easeInElastic:function(t,e,n,o,i){var r=1.70158,s=0,a=o;if(0==e)return n;if(1==(e/=i))return n+o;if(s||(s=.3*i),a<Math.abs(o)){a=o;var r=s/4}else var r=s/(2*Math.PI)*Math.asin(o/a);return-(a*Math.pow(2,10*(e-=1))*Math.sin(2*(e*i-r)*Math.PI/s))+n},easeOutElastic:function(t,e,n,o,i){var r=1.70158,s=0,a=o;if(0==e)return n;if(1==(e/=i))return n+o;if(s||(s=.3*i),a<Math.abs(o)){a=o;var r=s/4}else var r=s/(2*Math.PI)*Math.asin(o/a);return a*Math.pow(2,-10*e)*Math.sin(2*(e*i-r)*Math.PI/s)+o+n},easeInOutElastic:function(t,e,n,o,i){var r=1.70158,s=0,a=o;if(0==e)return n;if(2==(e/=i/2))return n+o;if(s||(s=.3*i*1.5),a<Math.abs(o)){a=o;var r=s/4}else var r=s/(2*Math.PI)*Math.asin(o/a);return 1>e?-.5*a*Math.pow(2,10*(e-=1))*Math.sin(2*(e*i-r)*Math.PI/s)+n:a*Math.pow(2,-10*(e-=1))*Math.sin(2*(e*i-r)*Math.PI/s)*.5+o+n},easeInBack:function(t,e,n,o,i,r){return void 0==r&&(r=1.70158),o*(e/=i)*e*((r+1)*e-r)+n},easeOutBack:function(t,e,n,o,i,r){return void 0==r&&(r=1.70158),o*((e=e/i-1)*e*((r+1)*e+r)+1)+n},easeInOutBack:function(t,e,n,o,i,r){return void 0==r&&(r=1.70158),(e/=i/2)<1?o/2*e*e*(((r*=1.525)+1)*e-r)+n:o/2*((e-=2)*e*(((r*=1.525)+1)*e+r)+2)+n},easeInBounce:function(t,e,n,o,i){return o-jQuery.easing.easeOutBounce(t,i-e,0,o,i)+n},easeOutBounce:function(t,e,n,o,i){return(e/=i)<1/2.75?7.5625*o*e*e+n:2/2.75>e?o*(7.5625*(e-=1.5/2.75)*e+.75)+n:2.5/2.75>e?o*(7.5625*(e-=2.25/2.75)*e+.9375)+n:o*(7.5625*(e-=2.625/2.75)*e+.984375)+n},easeInOutBounce:function(t,e,n,o,i){return i/2>e?.5*jQuery.easing.easeInBounce(t,2*e,0,o,i)+n:.5*jQuery.easing.easeOutBounce(t,2*e-i,0,o,i)+.5*o+n}}),function(){"use strict";function t(e,o){function i(t,e){return function(){return t.apply(e,arguments)}}var r;if(o=o||{},this.trackingClick=!1,this.trackingClickStart=0,this.targetElement=null,this.touchStartX=0,this.touchStartY=0,this.lastTouchIdentifier=0,this.touchBoundary=o.touchBoundary||10,this.layer=e,this.tapDelay=o.tapDelay||200,this.tapTimeout=o.tapTimeout||700,!t.notNeeded(e)){for(var s=["onMouse","onClick","onTouchStart","onTouchMove","onTouchEnd","onTouchCancel"],a=this,l=0,c=s.length;c>l;l++)a[s[l]]=i(a[s[l]],a);n&&(e.addEventListener("mouseover",this.onMouse,!0),e.addEventListener("mousedown",this.onMouse,!0),e.addEventListener("mouseup",this.onMouse,!0)),e.addEventListener("click",this.onClick,!0),e.addEventListener("touchstart",this.onTouchStart,!1),e.addEventListener("touchmove",this.onTouchMove,!1),e.addEventListener("touchend",this.onTouchEnd,!1),e.addEventListener("touchcancel",this.onTouchCancel,!1),Event.prototype.stopImmediatePropagation||(e.removeEventListener=function(t,n,o){var i=Node.prototype.removeEventListener;"click"===t?i.call(e,t,n.hijacked||n,o):i.call(e,t,n,o)},e.addEventListener=function(t,n,o){var i=Node.prototype.addEventListener;"click"===t?i.call(e,t,n.hijacked||(n.hijacked=function(t){t.propagationStopped||n(t)}),o):i.call(e,t,n,o)}),"function"==typeof e.onclick&&(r=e.onclick,e.addEventListener("click",function(t){r(t)},!1),e.onclick=null)}}var e=navigator.userAgent.indexOf("Windows Phone")>=0,n=navigator.userAgent.indexOf("Android")>0&&!e,o=/iP(ad|hone|od)/.test(navigator.userAgent)&&!e,i=o&&/OS 4_\d(_\d)?/.test(navigator.userAgent),r=o&&/OS [6-7]_\d/.test(navigator.userAgent),s=navigator.userAgent.indexOf("BB10")>0;t.prototype.needsClick=function(t){switch(t.nodeName.toLowerCase()){case"button":case"select":case"textarea":if(t.disabled)return!0;break;case"input":if(o&&"file"===t.type||t.disabled)return!0;break;case"label":case"iframe":case"video":return!0}return/\bneedsclick\b/.test(t.className)},t.prototype.needsFocus=function(t){switch(t.nodeName.toLowerCase()){case"textarea":return!0;case"select":return!n;case"input":switch(t.type){case"button":case"checkbox":case"file":case"image":case"radio":case"submit":return!1}return!t.disabled&&!t.readOnly;default:return/\bneedsfocus\b/.test(t.className)}},t.prototype.sendClick=function(t,e){var n,o;document.activeElement&&document.activeElement!==t&&document.activeElement.blur(),o=e.changedTouches[0],n=document.createEvent("MouseEvents"),n.initMouseEvent(this.determineEventType(t),!0,!0,window,1,o.screenX,o.screenY,o.clientX,o.clientY,!1,!1,!1,!1,0,null),n.forwardedTouchEvent=!0,t.dispatchEvent(n)},t.prototype.determineEventType=function(t){return n&&"select"===t.tagName.toLowerCase()?"mousedown":"click"},t.prototype.focus=function(t){var e;o&&t.setSelectionRange&&0!==t.type.indexOf("date")&&"time"!==t.type&&"month"!==t.type?(e=t.value.length,t.setSelectionRange(e,e)):t.focus()},t.prototype.updateScrollParent=function(t){var e,n;if(e=t.fastClickScrollParent,!e||!e.contains(t)){n=t;do{if(n.scrollHeight>n.offsetHeight){e=n,t.fastClickScrollParent=n;break}n=n.parentElement}while(n)}e&&(e.fastClickLastScrollTop=e.scrollTop)},t.prototype.getTargetElementFromEventTarget=function(t){return t.nodeType===Node.TEXT_NODE?t.parentNode:t},t.prototype.onTouchStart=function(t){var e,n,r;if(t.targetTouches.length>1)return!0;if(e=this.getTargetElementFromEventTarget(t.target),n=t.targetTouches[0],o){if(r=window.getSelection(),r.rangeCount&&!r.isCollapsed)return!0;if(!i){if(n.identifier&&n.identifier===this.lastTouchIdentifier)return t.preventDefault(),!1;this.lastTouchIdentifier=n.identifier,this.updateScrollParent(e)}}return this.trackingClick=!0,this.trackingClickStart=t.timeStamp,this.targetElement=e,this.touchStartX=n.pageX,this.touchStartY=n.pageY,t.timeStamp-this.lastClickTime<this.tapDelay&&t.preventDefault(),!0},t.prototype.touchHasMoved=function(t){var e=t.changedTouches[0],n=this.touchBoundary;return Math.abs(e.pageX-this.touchStartX)>n||Math.abs(e.pageY-this.touchStartY)>n?!0:!1},t.prototype.onTouchMove=function(t){return this.trackingClick?((this.targetElement!==this.getTargetElementFromEventTarget(t.target)||this.touchHasMoved(t))&&(this.trackingClick=!1,this.targetElement=null),!0):!0},t.prototype.findControl=function(t){return void 0!==t.control?t.control:t.htmlFor?document.getElementById(t.htmlFor):t.querySelector("button, input:not([type=hidden]), keygen, meter, output, progress, select, textarea")},t.prototype.onTouchEnd=function(t){var e,s,a,l,c,u=this.targetElement;if(!this.trackingClick)return!0;if(t.timeStamp-this.lastClickTime<this.tapDelay)return this.cancelNextClick=!0,!0;if(t.timeStamp-this.trackingClickStart>this.tapTimeout)return!0;if(this.cancelNextClick=!1,this.lastClickTime=t.timeStamp,s=this.trackingClickStart,this.trackingClick=!1,this.trackingClickStart=0,r&&(c=t.changedTouches[0],u=document.elementFromPoint(c.pageX-window.pageXOffset,c.pageY-window.pageYOffset)||u,u.fastClickScrollParent=this.targetElement.fastClickScrollParent),a=u.tagName.toLowerCase(),"label"===a){if(e=this.findControl(u)){if(this.focus(u),n)return!1;u=e}}else if(this.needsFocus(u))return t.timeStamp-s>100||o&&window.top!==window&&"input"===a?(this.targetElement=null,!1):(this.focus(u),this.sendClick(u,t),o&&"select"===a||(this.targetElement=null,t.preventDefault()),!1);return o&&!i&&(l=u.fastClickScrollParent,l&&l.fastClickLastScrollTop!==l.scrollTop)?!0:(this.needsClick(u)||(t.preventDefault(),this.sendClick(u,t)),!1)},t.prototype.onTouchCancel=function(){this.trackingClick=!1,this.targetElement=null},t.prototype.onMouse=function(t){return this.targetElement?t.forwardedTouchEvent?!0:!t.cancelable||this.needsClick(this.targetElement)&&!this.cancelNextClick?!0:(t.stopImmediatePropagation?t.stopImmediatePropagation():t.propagationStopped=!0,t.stopPropagation(),t.preventDefault(),!1):!0},t.prototype.onClick=function(t){var e;return this.trackingClick?(this.targetElement=null,this.trackingClick=!1,!0):"submit"===t.target.type&&0===t.detail?!0:(e=this.onMouse(t),e||(this.targetElement=null),e)},t.prototype.destroy=function(){var t=this.layer;n&&(t.removeEventListener("mouseover",this.onMouse,!0),t.removeEventListener("mousedown",this.onMouse,!0),t.removeEventListener("mouseup",this.onMouse,!0)),t.removeEventListener("click",this.onClick,!0),t.removeEventListener("touchstart",this.onTouchStart,!1),t.removeEventListener("touchmove",this.onTouchMove,!1),t.removeEventListener("touchend",this.onTouchEnd,!1),t.removeEventListener("touchcancel",this.onTouchCancel,!1)},t.notNeeded=function(t){var e,o,i,r;if("undefined"==typeof window.ontouchstart)return!0;if(o=+(/Chrome\/([0-9]+)/.exec(navigator.userAgent)||[,0])[1]){if(!n)return!0;if(e=document.querySelector("meta[name=viewport]")){if(-1!==e.content.indexOf("user-scalable=no"))return!0;if(o>31&&document.documentElement.scrollWidth<=window.outerWidth)return!0}}if(s&&(i=navigator.userAgent.match(/Version\/([0-9]*)\.([0-9]*)/),i[1]>=10&&i[2]>=3&&(e=document.querySelector("meta[name=viewport]")))){if(-1!==e.content.indexOf("user-scalable=no"))return!0;if(document.documentElement.scrollWidth<=window.outerWidth)return!0}return"none"===t.style.msTouchAction||"manipulation"===t.style.touchAction?!0:(r=+(/Firefox\/([0-9]+)/.exec(navigator.userAgent)||[,0])[1],r>=27&&(e=document.querySelector("meta[name=viewport]"),e&&(-1!==e.content.indexOf("user-scalable=no")||document.documentElement.scrollWidth<=window.outerWidth))?!0:"none"===t.style.touchAction||"manipulation"===t.style.touchAction?!0:!1)},t.attach=function(e,n){return new t(e,n)},"function"==typeof define&&"object"==typeof define.amd&&define.amd?define(function(){return t}):"undefined"!=typeof module&&module.exports?(module.exports=t.attach,module.exports.FastClick=t):window.FastClick=t}(),function(t){t.fn.onScreen=function(e){var n={container:window,direction:"vertical",toggleClass:null,doIn:null,doOut:null,tolerance:0,throttle:null,lazyAttr:null,lazyPlaceholder:"data:image/gif;base64,R0lGODlhEAAFAIAAAP///////yH/C05FVFNDQVBFMi4wAwEAAAAh+QQJCQAAACwAAAAAEAAFAAACCIyPqcvtD00BACH5BAkJAAIALAAAAAAQAAUAgfT29Pz6/P///wAAAAIQTGCiywKPmjxUNhjtMlWrAgAh+QQJCQAFACwAAAAAEAAFAIK8urzc2tzEwsS8vrzc3tz///8AAAAAAAADFEiyUf6wCEBHvLPemIHdTzCMDegkACH5BAkJAAYALAAAAAAQAAUAgoSChLS2tIyKjLy+vIyOjMTCxP///wAAAAMUWCQ09jAaAiqQmFosdeXRUAkBCCUAIfkECQkACAAsAAAAABAABQCDvLq83N7c3Nrc9Pb0xMLE/P78vL68/Pr8////AAAAAAAAAAAAAAAAAAAAAAAAAAAABCEwkCnKGbegvQn4RjGMx8F1HxBi5Il4oEiap2DcVYlpZwQAIfkECQkACAAsAAAAABAABQCDvLq85OLkxMLE9Pb0vL685ObkxMbE/Pr8////AAAAAAAAAAAAAAAAAAAAAAAAAAAABCDwnCGHEcIMxPn4VAGMQNBx0zQEZHkiYNiap5RaBKG9EQAh+QQJCQAJACwAAAAAEAAFAIOEgoTMysyMjozs6uyUlpSMiozMzsyUkpTs7uz///8AAAAAAAAAAAAAAAAAAAAAAAAEGTBJiYgoBM09DfhAwHEeKI4dGKLTIHzCwEUAIfkECQkACAAsAAAAABAABQCDvLq85OLkxMLE9Pb0vL685ObkxMbE/Pr8////AAAAAAAAAAAAAAAAAAAAAAAAAAAABCAQSTmMEGaco8+UBSACwWBqHxKOJYd+q1iaXFoRRMbtEQAh+QQJCQAIACwAAAAAEAAFAIO8urzc3tzc2tz09vTEwsT8/vy8vrz8+vz///8AAAAAAAAAAAAAAAAAAAAAAAAAAAAEIhBJWc6wJZAtJh3gcRBAaXiIZV2kiRbgNZbA6VXiUAhGL0QAIfkECQkABgAsAAAAABAABQCChIKEtLa0jIqMvL68jI6MxMLE////AAAAAxRoumxFgoxGCbiANos145e3DJcQJAAh+QQJCQAFACwAAAAAEAAFAIK8urzc2tzEwsS8vrzc3tz///8AAAAAAAADFFi6XCQwtCmAHbPVm9kGWKcEQxkkACH5BAkJAAIALAAAAAAQAAUAgfT29Pz6/P///wAAAAIRlI8SAZsPYnuJMUCRnNksWwAAOw==",debug:!1};return"remove"!==e&&t.extend(n,e),this.each(function(){function o(){t(A).off("scroll.onScreen resize.onScreen"),t(window).off("resize.onScreen")}function i(){return E?w<m-n.tolerance&&d<w+y-n.tolerance:w<h-n.tolerance&&w>-y+n.tolerance}function r(){return E?w+(y-n.tolerance)<d||w>m-n.tolerance:w>h-n.tolerance||-y+n.tolerance>w}function s(){return E?x<v-n.tolerance&&f<x+b-n.tolerance:x<g-n.tolerance&&x>-b+n.tolerance}function a(){return E?x+(b-n.tolerance)<f||x>v-n.tolerance:x>g-n.tolerance||-b+n.tolerance>x}function l(){return T?!1:"horizontal"===n.direction?s():i()}function c(){return T?"horizontal"===n.direction?a():r():!1}function u(t,e,n){var o,i,r;return function(){i=arguments,r=!0,n=n||this,o||!function(){r?(t.apply(n,i),r=!1,o=setTimeout(arguments.callee,e)):o=null}()}}var d,f,p,h,g,m,v,y,b,w,x,A=this,T=!1,C=t(this),E=t.isWindow(n.container);if("remove"===e)return void o();var k=function(){if(E||"static"!==t(n.container).css("position")||t(n.container).css("position","relative"),p=t(n.container),h=p.height(),g=p.width(),m=p.scrollTop()+h,v=p.scrollLeft()+g,y=C.outerHeight(!0),b=C.outerWidth(!0),E){var e=C.offset();w=e.top,x=e.left}else{var o=C.position();w=o.top,x=o.left}if(d=p.scrollTop(),f=p.scrollLeft(),n.debug&&(console.log("Container: "+n.container+"\nWidth: "+h+"\nHeight: "+g+"\nBottom: "+m+"\nRight: "+v),console.log("Matched element: "+(void 0!==C.attr("class")?C.prop("tagName").toLowerCase()+"."+C.attr("class"):C.prop("tagName").toLowerCase())+"\nLeft: "+x+"\nTop: "+w+"\nWidth: "+b+"\nHeight: "+y)),l()){if(n.toggleClass&&C.addClass(n.toggleClass),t.isFunction(n.doIn)&&n.doIn.call(C[0]),n.lazyAttr&&"IMG"===C.prop("tagName")){var i=C.attr(n.lazyAttr);i!==C.prop("src")&&(C.css({background:"url("+n.lazyPlaceholder+") 50% 50% no-repeat",minHeight:"5px",minWidth:"16px"}),C.prop("src",i).load(function(){t(this).css({background:"none"})}))}T=!0}else c()&&(n.toggleClass&&C.removeClass(n.toggleClass),t.isFunction(n.doOut)&&n.doOut.call(C[0]),T=!1)};window.location.hash?u(k,50):k(),n.throttle&&(k=u(k,n.throttle)),t(n.container).on("scroll.onScreen resize.onScreen",k),E||t(window).on("resize.onScreen",k),"object"==typeof module&&module&&"object"==typeof module.exports?module.exports=jQuery:"function"==typeof define&&define.amd&&define("jquery-onscreen",[],function(){return jQuery})})}}(jQuery),function(t){function e(t,e){return t.toFixed(e.decimals)}t.fn.countTo=function(e){return e=e||{},t(this).each(function(){function n(){u+=s,c++,o(u),"function"==typeof i.onUpdate&&i.onUpdate.call(a,u),c>=r&&(l.removeData("countTo"),clearInterval(d.interval),u=i.to,"function"==typeof i.onComplete&&i.onComplete.call(a,u))}function o(t){var e=i.formatter.call(a,t,i);l.text(e)}var i=t.extend({},t.fn.countTo.defaults,{from:t(this).data("from"),to:t(this).data("to"),speed:t(this).data("speed"),refreshInterval:t(this).data("refresh-interval"),decimals:t(this).data("decimals")},e),r=Math.ceil(i.speed/i.refreshInterval),s=(i.to-i.from)/r,a=this,l=t(this),c=0,u=i.from,d=l.data("countTo")||{};l.data("countTo",d),d.interval&&clearInterval(d.interval),d.interval=setInterval(n,i.refreshInterval),o(u)})},t.fn.countTo.defaults={from:0,to:0,speed:1e3,refreshInterval:100,decimals:0,formatter:e,onUpdate:null,onComplete:null}}(jQuery),function t(e,n,o){function i(s,a){if(!n[s]){if(!e[s]){var l="function"==typeof require&&require;if(!a&&l)return l(s,!0);if(r)return r(s,!0);var c=new Error("Cannot find module '"+s+"'");throw c.code="MODULE_NOT_FOUND",c}var u=n[s]={exports:{}};e[s][0].call(u.exports,function(t){var n=e[s][1][t];return i(n?n:t)},u,u.exports,t,e,n,o)}return n[s].exports}for(var r="function"==typeof require&&require,s=0;s<o.length;s++)i(o[s]);return i}({1:[function(t,e,n){"use strict";function o(t){t.fn.perfectScrollbar=function(e){return this.each(function(){if("object"==typeof e||"undefined"==typeof e){var n=e;r.get(this)||i.initialize(this,n)}else{var o=e;"update"===o?i.update(this):"destroy"===o&&i.destroy(this)}return t(this)})}}var i=t("../main"),r=t("../plugin/instances");if("function"==typeof define&&define.amd)define(["jquery"],o);else{var s=window.jQuery?window.jQuery:window.$;"undefined"!=typeof s&&o(s)}e.exports=o},{"../main":7,"../plugin/instances":18}],2:[function(t,e,n){"use strict";function o(t,e){var n=t.className.split(" ");n.indexOf(e)<0&&n.push(e),t.className=n.join(" ")}function i(t,e){var n=t.className.split(" "),o=n.indexOf(e);o>=0&&n.splice(o,1),t.className=n.join(" ")}n.add=function(t,e){t.classList?t.classList.add(e):o(t,e)},n.remove=function(t,e){t.classList?t.classList.remove(e):i(t,e)},n.list=function(t){return t.classList?t.classList:t.className.split(" ")}},{}],3:[function(t,e,n){"use strict";function o(t,e){return window.getComputedStyle(t)[e]}function i(t,e,n){return"number"==typeof n&&(n=n.toString()+"px"),t.style[e]=n,t}function r(t,e){for(var n in e){var o=e[n];"number"==typeof o&&(o=o.toString()+"px"),t.style[n]=o}return t}n.e=function(t,e){var n=document.createElement(t);return n.className=e,n},n.appendTo=function(t,e){return e.appendChild(t),t},n.css=function(t,e,n){return"object"==typeof e?r(t,e):"undefined"==typeof n?o(t,e):i(t,e,n)},n.matches=function(t,e){return"undefined"!=typeof t.matches?t.matches(e):"undefined"!=typeof t.matchesSelector?t.matchesSelector(e):"undefined"!=typeof t.webkitMatchesSelector?t.webkitMatchesSelector(e):"undefined"!=typeof t.mozMatchesSelector?t.mozMatchesSelector(e):"undefined"!=typeof t.msMatchesSelector?t.msMatchesSelector(e):void 0},n.remove=function(t){"undefined"!=typeof t.remove?t.remove():t.parentNode&&t.parentNode.removeChild(t)}},{}],4:[function(t,e,n){"use strict";var o=function(t){this.element=t,this.events={}};o.prototype.bind=function(t,e){"undefined"==typeof this.events[t]&&(this.events[t]=[]),this.events[t].push(e),this.element.addEventListener(t,e,!1)},o.prototype.unbind=function(t,e){var n="undefined"!=typeof e;this.events[t]=this.events[t].filter(function(o){return n&&o!==e?!0:(this.element.removeEventListener(t,o,!1),!1)},this)},o.prototype.unbindAll=function(){for(var t in this.events)this.unbind(t)};var i=function(){this.eventElements=[]};i.prototype.eventElement=function(t){var e=this.eventElements.filter(function(e){return e.element===t})[0];return"undefined"==typeof e&&(e=new o(t),this.eventElements.push(e)),e},i.prototype.bind=function(t,e,n){this.eventElement(t).bind(e,n)},i.prototype.unbind=function(t,e,n){this.eventElement(t).unbind(e,n)},i.prototype.unbindAll=function(){for(var t=0;t<this.eventElements.length;t++)this.eventElements[t].unbindAll()},i.prototype.once=function(t,e,n){var o=this.eventElement(t),i=function(t){o.unbind(e,i),n(t)};o.bind(e,i)},e.exports=i},{}],5:[function(t,e,n){"use strict";e.exports=function(){function t(){return Math.floor(65536*(1+Math.random())).toString(16).substring(1)}return function(){return t()+t()+"-"+t()+"-"+t()+"-"+t()+"-"+t()+t()+t()}}()},{}],6:[function(t,e,n){"use strict";var o=t("./class"),i=t("./dom");n.toInt=function(t){return"string"==typeof t?parseInt(t,10):~~t},n.clone=function(t){if(null===t)return null;if("object"==typeof t){var e={};for(var n in t)e[n]=this.clone(t[n]);return e}return t},n.extend=function(t,e){var n=this.clone(t);for(var o in e)n[o]=this.clone(e[o]);return n},n.isEditable=function(t){return i.matches(t,"input,[contenteditable]")||i.matches(t,"select,[contenteditable]")||i.matches(t,"textarea,[contenteditable]")||i.matches(t,"button,[contenteditable]")},n.removePsClasses=function(t){for(var e=o.list(t),n=0;n<e.length;n++){var i=e[n];0===i.indexOf("ps-")&&o.remove(t,i)}},n.outerWidth=function(t){return this.toInt(i.css(t,"width"))+this.toInt(i.css(t,"paddingLeft"))+this.toInt(i.css(t,"paddingRight"))+this.toInt(i.css(t,"borderLeftWidth"))+this.toInt(i.css(t,"borderRightWidth"))},n.startScrolling=function(t,e){o.add(t,"ps-in-scrolling"),"undefined"!=typeof e?o.add(t,"ps-"+e):(o.add(t,"ps-x"),o.add(t,"ps-y"))},n.stopScrolling=function(t,e){o.remove(t,"ps-in-scrolling"),"undefined"!=typeof e?o.remove(t,"ps-"+e):(o.remove(t,"ps-x"),o.remove(t,"ps-y"))},n.env={isWebKit:"WebkitAppearance"in document.documentElement.style,supportsTouch:"ontouchstart"in window||window.DocumentTouch&&document instanceof window.DocumentTouch,supportsIePointer:null!==window.navigator.msMaxTouchPoints}},{"./class":2,"./dom":3}],7:[function(t,e,n){"use strict";var o=t("./plugin/destroy"),i=t("./plugin/initialize"),r=t("./plugin/update");e.exports={initialize:i,update:r,destroy:o}},{"./plugin/destroy":9,"./plugin/initialize":17,"./plugin/update":20}],8:[function(t,e,n){"use strict";e.exports={wheelSpeed:1,wheelPropagation:!1,swipePropagation:!0,minScrollbarLength:null,maxScrollbarLength:null,useBothWheelAxes:!1,useKeyboard:!0,suppressScrollX:!1,suppressScrollY:!1,scrollXMarginOffset:0,scrollYMarginOffset:0}},{}],9:[function(t,e,n){"use strict";var o=t("../lib/dom"),i=t("../lib/helper"),r=t("./instances");e.exports=function(t){var e=r.get(t);e.event.unbindAll(),o.remove(e.scrollbarX),o.remove(e.scrollbarY),o.remove(e.scrollbarXRail),o.remove(e.scrollbarYRail),i.removePsClasses(t),r.remove(t)}},{"../lib/dom":3,"../lib/helper":6,"./instances":18}],10:[function(t,e,n){"use strict";function o(t,e){function n(t){return t.getBoundingClientRect()}var o=window.Event.prototype.stopPropagation.bind;e.event.bind(e.scrollbarY,"click",o),e.event.bind(e.scrollbarYRail,"click",function(o){var r=i.toInt(e.scrollbarYHeight/2),a=o.pageY-n(e.scrollbarYRail).top-r,l=e.containerHeight-e.scrollbarYHeight,c=a/l;0>c?c=0:c>1&&(c=1),t.scrollTop=(e.contentHeight-e.containerHeight)*c,s(t)}),e.event.bind(e.scrollbarX,"click",o),e.event.bind(e.scrollbarXRail,"click",function(o){var r=i.toInt(e.scrollbarXWidth/2),a=o.pageX-n(e.scrollbarXRail).left-r;console.log(o.pageX,e.scrollbarXRail.offsetLeft);var l=e.containerWidth-e.scrollbarXWidth,c=a/l;0>c?c=0:c>1&&(c=1),t.scrollLeft=(e.contentWidth-e.containerWidth)*c,s(t)})}var i=t("../../lib/helper"),r=t("../instances"),s=t("../update-geometry");e.exports=function(t){var e=r.get(t);o(t,e)}},{"../../lib/helper":6,"../instances":18,"../update-geometry":19}],11:[function(t,e,n){"use strict";function o(t,e){function n(n){var i=o+n,r=e.containerWidth-e.scrollbarXWidth;0>i?e.scrollbarXLeft=0:i>r?e.scrollbarXLeft=r:e.scrollbarXLeft=i;var a=s.toInt(e.scrollbarXLeft*(e.contentWidth-e.containerWidth)/(e.containerWidth-e.scrollbarXWidth));t.scrollLeft=a}var o=null,i=null,a=function(e){n(e.pageX-i),l(t),e.stopPropagation(),e.preventDefault()},c=function(){s.stopScrolling(t,"x"),e.event.unbind(e.ownerDocument,"mousemove",a)};e.event.bind(e.scrollbarX,"mousedown",function(n){i=n.pageX,o=s.toInt(r.css(e.scrollbarX,"left")),s.startScrolling(t,"x"),e.event.bind(e.ownerDocument,"mousemove",a),e.event.once(e.ownerDocument,"mouseup",c),n.stopPropagation(),n.preventDefault()})}function i(t,e){function n(n){var i=o+n,r=e.containerHeight-e.scrollbarYHeight;0>i?e.scrollbarYTop=0:i>r?e.scrollbarYTop=r:e.scrollbarYTop=i;var a=s.toInt(e.scrollbarYTop*(e.contentHeight-e.containerHeight)/(e.containerHeight-e.scrollbarYHeight));t.scrollTop=a}var o=null,i=null,a=function(e){n(e.pageY-i),l(t),e.stopPropagation(),e.preventDefault()},c=function(){s.stopScrolling(t,"y"),e.event.unbind(e.ownerDocument,"mousemove",a)};e.event.bind(e.scrollbarY,"mousedown",function(n){i=n.pageY,o=s.toInt(r.css(e.scrollbarY,"top")),s.startScrolling(t,"y"),e.event.bind(e.ownerDocument,"mousemove",a),e.event.once(e.ownerDocument,"mouseup",c),n.stopPropagation(),n.preventDefault()})}var r=t("../../lib/dom"),s=t("../../lib/helper"),a=t("../instances"),l=t("../update-geometry");e.exports=function(t){var e=a.get(t);o(t,e),i(t,e)}},{"../../lib/dom":3,"../../lib/helper":6,"../instances":18,"../update-geometry":19}],12:[function(t,e,n){"use strict";function o(t,e){function n(n,o){var i=t.scrollTop;if(0===n){if(!e.scrollbarYActive)return!1;if(0===i&&o>0||i>=e.contentHeight-e.containerHeight&&0>o)return!e.settings.wheelPropagation}var r=t.scrollLeft;if(0===o){if(!e.scrollbarXActive)return!1;if(0===r&&0>n||r>=e.contentWidth-e.containerWidth&&n>0)return!e.settings.wheelPropagation}return!0}var o=!1;e.event.bind(t,"mouseenter",function(){o=!0}),e.event.bind(t,"mouseleave",function(){o=!1});var r=!1;e.event.bind(e.ownerDocument,"keydown",function(a){if((!a.isDefaultPrevented||!a.isDefaultPrevented())&&o){var l=document.activeElement?document.activeElement:e.ownerDocument.activeElement;if(l){for(;l.shadowRoot;)l=l.shadowRoot.activeElement;if(i.isEditable(l))return}var c=0,u=0;switch(a.which){case 37:c=-30;break;case 38:u=30;break;case 39:c=30;break;case 40:u=-30;break;case 33:u=90;break;case 32:case 34:u=-90;break;case 35:u=a.ctrlKey?-e.contentHeight:-e.containerHeight;break;case 36:u=a.ctrlKey?t.scrollTop:e.containerHeight;break;default:return}t.scrollTop=t.scrollTop-u,t.scrollLeft=t.scrollLeft+c,s(t),r=n(c,u),r&&a.preventDefault()}})}var i=t("../../lib/helper"),r=t("../instances"),s=t("../update-geometry");e.exports=function(t){var e=r.get(t);o(t,e)}},{"../../lib/helper":6,"../instances":18,"../update-geometry":19}],13:[function(t,e,n){"use strict";function o(t,e){function n(n,o){var i=t.scrollTop;if(0===n){if(!e.scrollbarYActive)return!1;if(0===i&&o>0||i>=e.contentHeight-e.containerHeight&&0>o)return!e.settings.wheelPropagation}var r=t.scrollLeft;if(0===o){if(!e.scrollbarXActive)return!1;if(0===r&&0>n||r>=e.contentWidth-e.containerWidth&&n>0)return!e.settings.wheelPropagation}return!0}function o(t){var e=t.deltaX,n=-1*t.deltaY;return("undefined"==typeof e||"undefined"==typeof n)&&(e=-1*t.wheelDeltaX/6,n=t.wheelDeltaY/6),t.deltaMode&&1===t.deltaMode&&(e*=10,n*=10),e!==e&&n!==n&&(e=0,n=t.wheelDelta),[e,n]}function r(e,n){var o=t.querySelector("textarea:hover");if(o){var i=o.scrollHeight-o.clientHeight;if(i>0&&!(0===o.scrollTop&&n>0||o.scrollTop===i&&0>n))return!0;var r=o.scrollLeft-o.clientWidth;if(r>0&&!(0===o.scrollLeft&&0>e||o.scrollLeft===r&&e>0))return!0}return!1}function a(a){if(i.env.isWebKit||!t.querySelector("select:focus")){var c=o(a),u=c[0],d=c[1];r(u,d)||(l=!1,e.settings.useBothWheelAxes?e.scrollbarYActive&&!e.scrollbarXActive?(d?t.scrollTop=t.scrollTop-d*e.settings.wheelSpeed:t.scrollTop=t.scrollTop+u*e.settings.wheelSpeed,l=!0):e.scrollbarXActive&&!e.scrollbarYActive&&(u?t.scrollLeft=t.scrollLeft+u*e.settings.wheelSpeed:t.scrollLeft=t.scrollLeft-d*e.settings.wheelSpeed,l=!0):(t.scrollTop=t.scrollTop-d*e.settings.wheelSpeed,t.scrollLeft=t.scrollLeft+u*e.settings.wheelSpeed),s(t),l=l||n(u,d),l&&(a.stopPropagation(),a.preventDefault()))}}var l=!1;"undefined"!=typeof window.onwheel?e.event.bind(t,"wheel",a):"undefined"!=typeof window.onmousewheel&&e.event.bind(t,"mousewheel",a)}var i=t("../../lib/helper"),r=t("../instances"),s=t("../update-geometry");e.exports=function(t){var e=r.get(t);o(t,e)}},{"../../lib/helper":6,"../instances":18,"../update-geometry":19}],14:[function(t,e,n){"use strict";function o(t,e){e.event.bind(t,"scroll",function(){r(t)})}var i=t("../instances"),r=t("../update-geometry");e.exports=function(t){var e=i.get(t);o(t,e)}},{"../instances":18,"../update-geometry":19}],15:[function(t,e,n){"use strict";function o(t,e){function n(){var t=window.getSelection?window.getSelection():document.getSelection?document.getSelection():"";return 0===t.toString().length?null:t.getRangeAt(0).commonAncestorContainer}function o(){l||(l=setInterval(function(){return r.get(t)?(t.scrollTop=t.scrollTop+c.top,t.scrollLeft=t.scrollLeft+c.left,void s(t)):void clearInterval(l)},50))}function a(){l&&(clearInterval(l),l=null),i.stopScrolling(t)}var l=null,c={top:0,left:0},u=!1;e.event.bind(e.ownerDocument,"selectionchange",function(){t.contains(n())?u=!0:(u=!1,a())}),e.event.bind(window,"mouseup",function(){u&&(u=!1,a())}),e.event.bind(window,"mousemove",function(e){if(u){var n={x:e.pageX,y:e.pageY},r={left:t.offsetLeft,right:t.offsetLeft+t.offsetWidth,top:t.offsetTop,bottom:t.offsetTop+t.offsetHeight};n.x<r.left+3?(c.left=-5,i.startScrolling(t,"x")):n.x>r.right-3?(c.left=5,i.startScrolling(t,"x")):c.left=0,n.y<r.top+3?(r.top+3-n.y<5?c.top=-5:c.top=-20,i.startScrolling(t,"y")):n.y>r.bottom-3?(n.y-r.bottom+3<5?c.top=5:c.top=20,i.startScrolling(t,"y")):c.top=0,0===c.top&&0===c.left?a():o()}})}var i=t("../../lib/helper"),r=t("../instances"),s=t("../update-geometry");e.exports=function(t){var e=r.get(t);o(t,e)}},{"../../lib/helper":6,"../instances":18,"../update-geometry":19}],16:[function(t,e,n){"use strict";function o(t,e,n,o){function s(n,o){var i=t.scrollTop,r=t.scrollLeft,s=Math.abs(n),a=Math.abs(o);if(a>s){if(0>o&&i===e.contentHeight-e.containerHeight||o>0&&0===i)return!e.settings.swipePropagation}else if(s>a&&(0>n&&r===e.contentWidth-e.containerWidth||n>0&&0===r))return!e.settings.swipePropagation;return!0}function a(e,n){t.scrollTop=t.scrollTop-n,t.scrollLeft=t.scrollLeft-e,r(t)}function l(){b=!0}function c(){b=!1}function u(t){return t.targetTouches?t.targetTouches[0]:t}function d(t){return t.targetTouches&&1===t.targetTouches.length?!0:t.pointerType&&"mouse"!==t.pointerType&&t.pointerType!==t.MSPOINTER_TYPE_MOUSE?!0:!1}function f(t){if(d(t)){w=!0;var e=u(t);g.pageX=e.pageX,g.pageY=e.pageY,m=(new Date).getTime(),null!==y&&clearInterval(y),t.stopPropagation()}}function p(t){if(!b&&w&&d(t)){var e=u(t),n={pageX:e.pageX,pageY:e.pageY},o=n.pageX-g.pageX,i=n.pageY-g.pageY;a(o,i),g=n;var r=(new Date).getTime(),l=r-m;l>0&&(v.x=o/l,v.y=i/l,m=r),s(o,i)&&(t.stopPropagation(),t.preventDefault())}}function h(){!b&&w&&(w=!1,clearInterval(y),y=setInterval(function(){return i.get(t)?Math.abs(v.x)<.01&&Math.abs(v.y)<.01?void clearInterval(y):(a(30*v.x,30*v.y),v.x*=.8,void(v.y*=.8)):void clearInterval(y)},10))}var g={},m=0,v={},y=null,b=!1,w=!1;n&&(e.event.bind(window,"touchstart",l),e.event.bind(window,"touchend",c),e.event.bind(t,"touchstart",f),e.event.bind(t,"touchmove",p),e.event.bind(t,"touchend",h)),o&&(window.PointerEvent?(e.event.bind(window,"pointerdown",l),e.event.bind(window,"pointerup",c),e.event.bind(t,"pointerdown",f),e.event.bind(t,"pointermove",p),e.event.bind(t,"pointerup",h)):window.MSPointerEvent&&(e.event.bind(window,"MSPointerDown",l),
e.event.bind(window,"MSPointerUp",c),e.event.bind(t,"MSPointerDown",f),e.event.bind(t,"MSPointerMove",p),e.event.bind(t,"MSPointerUp",h)))}var i=t("../instances"),r=t("../update-geometry");e.exports=function(t,e,n){var r=i.get(t);o(t,r,e,n)}},{"../instances":18,"../update-geometry":19}],17:[function(t,e,n){"use strict";var o=t("../lib/class"),i=t("../lib/helper"),r=t("./instances"),s=t("./update-geometry"),a=t("./handler/click-rail"),l=t("./handler/drag-scrollbar"),c=t("./handler/keyboard"),u=t("./handler/mouse-wheel"),d=t("./handler/native-scroll"),f=t("./handler/selection"),p=t("./handler/touch");e.exports=function(t,e){e="object"==typeof e?e:{},o.add(t,"ps-container");var n=r.add(t);n.settings=i.extend(n.settings,e),a(t),l(t),u(t),d(t),f(t),(i.env.supportsTouch||i.env.supportsIePointer)&&p(t,i.env.supportsTouch,i.env.supportsIePointer),n.settings.useKeyboard&&c(t),s(t)}},{"../lib/class":2,"../lib/helper":6,"./handler/click-rail":10,"./handler/drag-scrollbar":11,"./handler/keyboard":12,"./handler/mouse-wheel":13,"./handler/native-scroll":14,"./handler/selection":15,"./handler/touch":16,"./instances":18,"./update-geometry":19}],18:[function(t,e,n){"use strict";function o(t){var e=this;e.settings=d.clone(l),e.containerWidth=null,e.containerHeight=null,e.contentWidth=null,e.contentHeight=null,e.isRtl="rtl"===a.css(t,"direction"),e.event=new c,e.ownerDocument=t.ownerDocument||document,e.scrollbarXRail=a.appendTo(a.e("div","ps-scrollbar-x-rail"),t),e.scrollbarX=a.appendTo(a.e("div","ps-scrollbar-x"),e.scrollbarXRail),e.scrollbarXActive=null,e.scrollbarXWidth=null,e.scrollbarXLeft=null,e.scrollbarXBottom=d.toInt(a.css(e.scrollbarXRail,"bottom")),e.isScrollbarXUsingBottom=e.scrollbarXBottom===e.scrollbarXBottom,e.scrollbarXTop=e.isScrollbarXUsingBottom?null:d.toInt(a.css(e.scrollbarXRail,"top")),e.railBorderXWidth=d.toInt(a.css(e.scrollbarXRail,"borderLeftWidth"))+d.toInt(a.css(e.scrollbarXRail,"borderRightWidth")),e.railXMarginWidth=d.toInt(a.css(e.scrollbarXRail,"marginLeft"))+d.toInt(a.css(e.scrollbarXRail,"marginRight")),e.railXWidth=null,e.scrollbarYRail=a.appendTo(a.e("div","ps-scrollbar-y-rail"),t),e.scrollbarY=a.appendTo(a.e("div","ps-scrollbar-y"),e.scrollbarYRail),e.scrollbarYActive=null,e.scrollbarYHeight=null,e.scrollbarYTop=null,e.scrollbarYRight=d.toInt(a.css(e.scrollbarYRail,"right")),e.isScrollbarYUsingRight=e.scrollbarYRight===e.scrollbarYRight,e.scrollbarYLeft=e.isScrollbarYUsingRight?null:d.toInt(a.css(e.scrollbarYRail,"left")),e.scrollbarYOuterWidth=e.isRtl?d.outerWidth(e.scrollbarY):null,e.railBorderYWidth=d.toInt(a.css(e.scrollbarYRail,"borderTopWidth"))+d.toInt(a.css(e.scrollbarYRail,"borderBottomWidth")),e.railYMarginHeight=d.toInt(a.css(e.scrollbarYRail,"marginTop"))+d.toInt(a.css(e.scrollbarYRail,"marginBottom")),e.railYHeight=null}function i(t){return"undefined"==typeof t.dataset?t.getAttribute("data-ps-id"):t.dataset.psId}function r(t,e){"undefined"==typeof t.dataset?t.setAttribute("data-ps-id",e):t.dataset.psId=e}function s(t){"undefined"==typeof t.dataset?t.removeAttribute("data-ps-id"):delete t.dataset.psId}var a=t("../lib/dom"),l=t("./default-setting"),c=t("../lib/event-manager"),u=t("../lib/guid"),d=t("../lib/helper"),f={};n.add=function(t){var e=u();return r(t,e),f[e]=new o(t),f[e]},n.remove=function(t){delete f[i(t)],s(t)},n.get=function(t){return f[i(t)]}},{"../lib/dom":3,"../lib/event-manager":4,"../lib/guid":5,"../lib/helper":6,"./default-setting":8}],19:[function(t,e,n){"use strict";function o(t,e){return t.settings.minScrollbarLength&&(e=Math.max(e,t.settings.minScrollbarLength)),t.settings.maxScrollbarLength&&(e=Math.min(e,t.settings.maxScrollbarLength)),e}function i(t,e){var n={width:e.railXWidth};e.isRtl?n.left=t.scrollLeft+e.containerWidth-e.contentWidth:n.left=t.scrollLeft,e.isScrollbarXUsingBottom?n.bottom=e.scrollbarXBottom-t.scrollTop:n.top=e.scrollbarXTop+t.scrollTop,s.css(e.scrollbarXRail,n);var o={top:t.scrollTop,height:e.railYHeight};e.isScrollbarYUsingRight?e.isRtl?o.right=e.contentWidth-t.scrollLeft-e.scrollbarYRight-e.scrollbarYOuterWidth:o.right=e.scrollbarYRight-t.scrollLeft:e.isRtl?o.left=t.scrollLeft+2*e.containerWidth-e.contentWidth-e.scrollbarYLeft-e.scrollbarYOuterWidth:o.left=e.scrollbarYLeft+t.scrollLeft,s.css(e.scrollbarYRail,o),s.css(e.scrollbarX,{left:e.scrollbarXLeft,width:e.scrollbarXWidth-e.railBorderXWidth}),s.css(e.scrollbarY,{top:e.scrollbarYTop,height:e.scrollbarYHeight-e.railBorderYWidth})}var r=t("../lib/class"),s=t("../lib/dom"),a=t("../lib/helper"),l=t("./instances");e.exports=function(t){var e=l.get(t);e.containerWidth=t.clientWidth,e.containerHeight=t.clientHeight,e.contentWidth=t.scrollWidth,e.contentHeight=t.scrollHeight,t.contains(e.scrollbarXRail)||s.appendTo(e.scrollbarXRail,t),t.contains(e.scrollbarYRail)||s.appendTo(e.scrollbarYRail,t),!e.settings.suppressScrollX&&e.containerWidth+e.settings.scrollXMarginOffset<e.contentWidth?(e.scrollbarXActive=!0,e.railXWidth=e.containerWidth-e.railXMarginWidth,e.scrollbarXWidth=o(e,a.toInt(e.railXWidth*e.containerWidth/e.contentWidth)),e.scrollbarXLeft=a.toInt(t.scrollLeft*(e.railXWidth-e.scrollbarXWidth)/(e.contentWidth-e.containerWidth))):(e.scrollbarXActive=!1,e.scrollbarXWidth=0,e.scrollbarXLeft=0,t.scrollLeft=0),!e.settings.suppressScrollY&&e.containerHeight+e.settings.scrollYMarginOffset<e.contentHeight?(e.scrollbarYActive=!0,e.railYHeight=e.containerHeight-e.railYMarginHeight,e.scrollbarYHeight=o(e,a.toInt(e.railYHeight*e.containerHeight/e.contentHeight)),e.scrollbarYTop=a.toInt(t.scrollTop*(e.railYHeight-e.scrollbarYHeight)/(e.contentHeight-e.containerHeight))):(e.scrollbarYActive=!1,e.scrollbarYHeight=0,e.scrollbarYTop=0,t.scrollTop=0),e.scrollbarXLeft>=e.railXWidth-e.scrollbarXWidth&&(e.scrollbarXLeft=e.railXWidth-e.scrollbarXWidth),e.scrollbarYTop>=e.railYHeight-e.scrollbarYHeight&&(e.scrollbarYTop=e.railYHeight-e.scrollbarYHeight),i(t,e),r[e.scrollbarXActive?"add":"remove"](t,"ps-active-x"),r[e.scrollbarYActive?"add":"remove"](t,"ps-active-y")}},{"../lib/class":2,"../lib/dom":3,"../lib/helper":6,"./instances":18}],20:[function(t,e,n){"use strict";var o=t("../lib/dom"),i=t("./instances"),r=t("./update-geometry");e.exports=function(t){var e=i.get(t);o.css(e.scrollbarXRail,"display","none"),o.css(e.scrollbarYRail,"display","none"),r(t),o.css(e.scrollbarXRail,"display","block"),o.css(e.scrollbarYRail,"display","block")}},{"../lib/dom":3,"./instances":18,"./update-geometry":19}]},{},[1]),function(t){"use strict";var e=t(".accordion > .accordion-container > .accordion-body"),n=t(".accordion > .accordion-container > .accordion-title > a");t(".accordion").length&&(e.hide(),t(".accordion").each(function(){t(this).find(".accordion-body").first().show(),t(this).find(".accordion-container").first().addClass("active")})),n.on("click",function(e){e.preventDefault(),e.stopPropagation();var n=t(this).parent();return t(this).closest(".accordion").hasClass("accordion-toggle")||(t(this).closest(".accordion").find(".accordion-body").slideUp(),t(this).closest(".accordion").find(".accordion-container").removeClass("active")),"block"!==n.next().css("display")?(n.next().slideDown(),n.parent().addClass("active"),!1):"block"===n.next().css("display")?(n.next().slideUp(),n.parent().removeClass("active"),!1):!1})}(jQuery),function(t){"use strict";var e=t("[data-animation]"),n=t(".count"),o=t(".progress-bar");t.fn.onScreen&&e.length?e.onScreen({doIn:function(){if(!t(this).hasClass("animation--done")){var e=t(this),n=e.data("animation")||"fadeIn",o=e.data("delay")||0;setTimeout(function(){e.addClass("animation--done animated "+n)},o)}}}):e.length&&e.each(function(){if(!t(this).hasClass("animation--done")){var e=t(this),n=e.data("animation")||"fadeIn",o=e.data("delay")||0;setTimeout(function(){e.addClass("animation--done animated "+n)},o)}}),t.fn.onScreen&&n.length?n.each(function(){var e=t(this);e.onScreen({doIn:function(){e.countTo({onComplete:function(){e.removeClass("count")}})}})}):n.length&&n.each(function(){var e=t(this);e.countTo({onComplete:function(){e.removeClass("count")}})}),t.fn.onScreen&&o.length?o.onScreen({doIn:function(){if(!t(this).hasClass("animation--done")){var e=t(this),n=e.data("percent");e.addClass("animation--done").animate({width:Math.ceil(n)+"%"},800,"easeInCubic")}}}):o.length&&o.each(function(){if(!t(this).hasClass("animation--done")){var e=t(this),n=e.data("percent");e.addClass("animation--done").animate({width:Math.ceil(n)+"%"},800,"easeInCubic")}})}(jQuery),function(t){"use strict";function e(){t(window).location=n}var n,o=t("a.transition");o.on("click",function(o){o.preventDefault(),o.stopPropagation(),n=this.href,t("body").fadeOut(1e3,e)})}(jQuery),function(t){"use strict";t("[data-toggle=panel-collapse]").on("click",function(e){var n=t(this).parents(".panel"),o=n.children(".panel-body");o.is(":visible")?(n.addClass("panel-collapsed"),o.slideUp(200)):o.is(":visible")||(n.removeClass("panel-collapsed"),o.slideDown(200)),e.preventDefault(),e.stopPropagation()}),t("[data-toggle=panel-refresh]").on("click",function(e){var n=t(this).parents(".panel");n.addClass("panel-refreshing"),window.setTimeout(function(){n.removeClass("panel-refreshing")},3e3),e.preventDefault(),e.stopPropagation()}),t("[data-toggle=panel-remove]").on("click",function(e){var n=t(this).parents(".panel");n.addClass("animated zoomOut"),n.bind("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd",function(){n.remove()}),e.preventDefault(),e.stopPropagation()})}(jQuery),function(t){"use strict";var e=t("body > .pageload");t(window).on("load",function(){t.fn.onScreen&&e.length?e.onScreen({doIn:function(){t(this).hasClass("page-loaded")||e.addClass("page-loaded")}}):e.length&&e.addClass("page-loaded")})}(jQuery),function(t){"use strict";function e(t,e,n){var o;return function(){var i=this,r=arguments,s=function(){o=null,n||t.apply(i,r)},a=n&&!o;clearTimeout(o),o=setTimeout(s,e),a&&t.apply(i,r)}}function n(){p?c.removeClass("layout-chat-open"):c.addClass("layout-chat-open"),p=!p}function o(){p&&n(),T?(c.removeClass("move-left move-right"),setTimeout(function(){c.removeClass("offscreen")},300)):c.addClass("offscreen "+w),T=!T,i()}function i(){setTimeout(function(){A=!1},300)}function r(){c.hasClass("layout-small-menu")||c.hasClass("layout-static-sidebar")||c.hasClass("layout-boxed")||t(".sidebar-panel > nav").perfectScrollbar({wheelPropagation:!0,suppressScrollX:!0})}function s(){C.perfectScrollbar("destroy").removeClass()}function a(){C.hasClass("ps-container")&&C.perfectScrollbar("update")}var l=(t(window),t("body")),c=t(".app"),u=t(".main-panel"),d=t("[data-toggle=layout-chat-open], [data-toggle=chat-dismiss]"),f=t(".chat-users #chat-list a, .chat-back"),p=!1,h=t(".app > .chat-panel");d.on("click",function(t){t.preventDefault(),t.stopPropagation(),n()}),f.on("click",function(t){t.preventDefault(),t.stopPropagation(),h.toggleClass("conversation-open")}),t(".chat-input").keydown(function(e){if(13===e.keyCode){e.preventDefault();var n=t(this).text();if(""===n)return;t(".chat-conversation-content").append("<div class='chat-conversation-user them'><div class='chat-conversation-message'><p>"+t(this).text()+"</p></div></div>"),t(this).text("")}});var g=t(".toggle-active"),m=t("[data-toggle=layout-small-menu]"),v=t("[data-toggle=quick-launch-panel]");g.on("click",function(e){e.preventDefault(),e.stopPropagation(),t(this).toggleClass("active")}),m.on("click",function(e){e.preventDefault(),e.stopPropagation(),c.toggleClass("layout-small-menu"),c.hasClass("layout-small-menu")?s():t(window).width()>768&&!C.hasClass("ps-container")&&r()}),v.on("click",function(t){t.preventDefault(),l.hasClass("layout-quick-launch-panel")?(l.removeClass("layout-quick-launch-panel"),setTimeout(function(){l.removeClass("stop-scrolling").css({transition:""})},300)):l.css({transition:"300ms cubic-bezier(.7,0,.3,1)"}).addClass("layout-quick-launch-panel stop-scrolling"),window.scrollTo(0,0)}),t(".scroll-up").on("click",function(e){return e.preventDefault(),e.stopPropagation(),t("html,body").stop().animate({scrollTop:l.offset().top},1e3),!1});var y=t(".smooth-scroll");y.on("click",function(e){if(e.preventDefault(),e.stopPropagation(),location.pathname.replace(/^\//,"")===this.pathname.replace(/^\//,"")&&location.hostname===this.hostname){var n=t(this.hash);if(n=n.length?n:t("[name="+this.hash.slice(1)+"]"),n.length)return t("html,body").stop().animate({scrollTop:n.offset().top},1e3),!1}});var b,w,x=t("[data-toggle=offscreen]"),A=!1,T=!1;x.on("click",function(e){e.preventDefault(),e.stopPropagation(),b=t(this).data("move")?t(this).data("move"):"ltr",w="rtl"===b?"move-right":"move-left",A||(A=!0,o())}),u.on("click",function(t){var e=t.target;T&&e!==x&&o()}),t(".sidebar-panel nav a").on("click",function(e){var n=t(this),i=n.parents("li"),r=n.closest("li"),s=t(".sidebar-panel nav li").not(i),l=n.next();return l.hasClass("sub-menu")?c.hasClass("layout-small-menu")&&r.parent().hasClass("nav")&&t(window).width()>768?void 0:(s.removeClass("open"),l.is("ul")&&0===l.height()?r.addClass("open"):l.is("ul")&&0!==l.height()&&r.removeClass("open"),"#"===n.attr("href")&&e.preventDefault(),a(),l.is("ul")?!1:(e.stopPropagation(),!0)):void o()}),t(".sidebar-panel").find("> li > .sub-menu").each(function(){t(this).find("ul.sub-menu").length>0&&t(this).addClass("multi-level")}),t(".sidebar-panel").find(".sub-menu").each(function(){t(this).parent("li").addClass("menu-accordion")});var C=t(".sidebar-panel > nav");r();var E=e(function(){return 767>=window.innerWidth?void(C.hasClass("ps-container")&&s()):void(C.hasClass("ps-container")||r())},300);window.addEventListener("resize",E)}(jQuery),$.restobot={};
/*! sortable.js 0.6.0 */

(function(){var a,b,c,d,e,f,g;a="table[data-sortable]",d=/^-?[£$¤]?[\d,.]+%?$/,g=/^\s+|\s+$/g,f="ontouchstart"in document.documentElement,c=f?"touchstart":"click",b=function(a,b,c){return null!=a.addEventListener?a.addEventListener(b,c,!1):a.attachEvent("on"+b,c)},e={init:function(b){var c,d,f,g,h;for(null==b&&(b={}),null==b.selector&&(b.selector=a),d=document.querySelectorAll(b.selector),h=[],f=0,g=d.length;g>f;f++)c=d[f],h.push(e.initTable(c));return h},initTable:function(a){var b,c,d,f,g,h;if(1===(null!=(h=a.tHead)?h.rows.length:void 0)&&"true"!==a.getAttribute("data-sortable-initialized")){for(a.setAttribute("data-sortable-initialized","true"),d=a.querySelectorAll("th"),b=f=0,g=d.length;g>f;b=++f)c=d[b],"false"!==c.getAttribute("data-sortable")&&e.setupClickableTH(a,c,b);return a}},setupClickableTH:function(a,d,f){var g;return g=e.getColumnType(a,f),b(d,c,function(){var b,c,h,i,j,k,l,m,n,o,p,q,r,s,t,u;for(j="true"===this.getAttribute("data-sorted"),k=this.getAttribute("data-sorted-direction"),b=j?"ascending"===k?"descending":"ascending":g.defaultSortDirection,m=this.parentNode.querySelectorAll("th"),n=0,q=m.length;q>n;n++)d=m[n],d.setAttribute("data-sorted","false"),d.removeAttribute("data-sorted-direction");for(this.setAttribute("data-sorted","true"),this.setAttribute("data-sorted-direction",b),l=a.tBodies[0],h=[],t=l.rows,o=0,r=t.length;r>o;o++)c=t[o],h.push([e.getNodeValue(c.cells[f]),c]);for(j?h.reverse():h.sort(g.compare),u=[],p=0,s=h.length;s>p;p++)i=h[p],u.push(l.appendChild(i[1]));return u})},getColumnType:function(a,b){var c,f,g,h,i;for(i=a.tBodies[0].rows,g=0,h=i.length;h>g;g++)if(c=i[g],f=e.getNodeValue(c.cells[b]),""!==f){if(f.match(d))return e.types.numeric;if(!isNaN(Date.parse(f)))return e.types.date}return e.types.alpha},getNodeValue:function(a){return a?null!==a.getAttribute("data-value")?a.getAttribute("data-value"):"undefined"!=typeof a.innerText?a.innerText.replace(g,""):a.textContent.replace(g,""):""},types:{numeric:{defaultSortDirection:"descending",compare:function(a,b){var c,d;return c=parseFloat(a[0].replace(/[^0-9.-]/g,""),10),d=parseFloat(b[0].replace(/[^0-9.-]/g,""),10),isNaN(c)&&(c=0),isNaN(d)&&(d=0),d-c}},alpha:{defaultSortDirection:"ascending",compare:function(a,b){return a[0].localeCompare(b[0])}},date:{defaultSortDirection:"ascending",compare:function(a,b){var c,d;return c=Date.parse(a[0]),d=Date.parse(b[0]),isNaN(c)&&(c=0),isNaN(d)&&(d=0),c-d}}}},setTimeout(e.init,0),window.Sortable=e}).call(this);
;(function($,window,document,undefined)
{var hasTouch='ontouchstart'in document;var hasPointerEvents=(function()
{var el=document.createElement('div'),docEl=document.documentElement;if(!('pointerEvents'in el.style)){return false;}
el.style.pointerEvents='auto';el.style.pointerEvents='x';docEl.appendChild(el);var supports=window.getComputedStyle&&window.getComputedStyle(el,'').pointerEvents==='auto';docEl.removeChild(el);return!!supports;})();var defaults={listNodeName:'ol',itemNodeName:'li',rootClass:'dd',listClass:'dd-list',itemClass:'dd-item',dragClass:'dd-dragel',handleClass:'dd-handle',collapsedClass:'dd-collapsed',placeClass:'dd-placeholder',noDragClass:'dd-nodrag',emptyClass:'dd-empty',expandBtnHTML:'<button data-action="expand" type="button">Expand</button>',collapseBtnHTML:'<button data-action="collapse" type="button">Collapse</button>',group:0,maxDepth:5,threshold:20};function Plugin(element,options)
{this.w=$(document);this.el=$(element);this.options=$.extend({},defaults,options);this.init();}
Plugin.prototype={init:function()
{var list=this;list.reset();list.el.data('nestable-group',this.options.group);list.placeEl=$('<div class="'+ list.options.placeClass+'"/>');$.each(this.el.find(list.options.itemNodeName),function(k,el){list.setParent($(el));});list.el.on('click','button',function(e){if(list.dragEl){return;}
var target=$(e.currentTarget),action=target.data('action'),item=target.parent(list.options.itemNodeName);if(action==='collapse'){list.collapseItem(item);}
if(action==='expand'){list.expandItem(item);}});var onStartEvent=function(e)
{var handle=$(e.target);if(!handle.hasClass(list.options.handleClass)){if(handle.closest('.'+ list.options.noDragClass).length){return;}
handle=handle.closest('.'+ list.options.handleClass);}
if(!handle.length||list.dragEl){return;}
list.isTouch=/^touch/.test(e.type);if(list.isTouch&&e.touches.length!==1){return;}
e.preventDefault();list.dragStart(e.touches?e.touches[0]:e);};var onMoveEvent=function(e)
{if(list.dragEl){e.preventDefault();list.dragMove(e.touches?e.touches[0]:e);}};var onEndEvent=function(e)
{if(list.dragEl){e.preventDefault();list.dragStop(e.touches?e.touches[0]:e);}};if(hasTouch){list.el[0].addEventListener('touchstart',onStartEvent,false);window.addEventListener('touchmove',onMoveEvent,false);window.addEventListener('touchend',onEndEvent,false);window.addEventListener('touchcancel',onEndEvent,false);}
list.el.on('mousedown',onStartEvent);list.w.on('mousemove',onMoveEvent);list.w.on('mouseup',onEndEvent);},serialize:function()
{var data,depth=0,list=this;step=function(level,depth)
{var array=[],items=level.children(list.options.itemNodeName);items.each(function()
{var li=$(this),item=$.extend({},li.data()),sub=li.children(list.options.listNodeName);if(sub.length){item.children=step(sub,depth+ 1);}
array.push(item);});return array;};data=step(list.el.find(list.options.listNodeName).first(),depth);return data;},serialise:function()
{return this.serialize();},reset:function()
{this.mouse={offsetX:0,offsetY:0,startX:0,startY:0,lastX:0,lastY:0,nowX:0,nowY:0,distX:0,distY:0,dirAx:0,dirX:0,dirY:0,lastDirX:0,lastDirY:0,distAxX:0,distAxY:0};this.isTouch=false;this.moving=false;this.dragEl=null;this.dragRootEl=null;this.dragDepth=0;this.hasNewRoot=false;this.pointEl=null;},expandItem:function(li)
{li.removeClass(this.options.collapsedClass);li.children('[data-action="expand"]').hide();li.children('[data-action="collapse"]').show();li.children(this.options.listNodeName).show();},collapseItem:function(li)
{var lists=li.children(this.options.listNodeName);if(lists.length){li.addClass(this.options.collapsedClass);li.children('[data-action="collapse"]').hide();li.children('[data-action="expand"]').show();li.children(this.options.listNodeName).hide();}},expandAll:function()
{var list=this;list.el.find(list.options.itemNodeName).each(function(){list.expandItem($(this));});},collapseAll:function()
{var list=this;list.el.find(list.options.itemNodeName).each(function(){list.collapseItem($(this));});},setParent:function(li)
{if(li.children(this.options.listNodeName).length){li.prepend($(this.options.expandBtnHTML));li.prepend($(this.options.collapseBtnHTML));}
li.children('[data-action="expand"]').hide();},unsetParent:function(li)
{li.removeClass(this.options.collapsedClass);li.children('[data-action]').remove();li.children(this.options.listNodeName).remove();},dragStart:function(e)
{var mouse=this.mouse,target=$(e.target),dragItem=target.closest(this.options.itemNodeName);this.placeEl.css('height',dragItem.height());mouse.offsetX=e.offsetX!==undefined?e.offsetX:e.pageX- target.offset().left;mouse.offsetY=e.offsetY!==undefined?e.offsetY:e.pageY- target.offset().top;mouse.startX=mouse.lastX=e.pageX;mouse.startY=mouse.lastY=e.pageY;this.dragRootEl=this.el;this.dragEl=$(document.createElement(this.options.listNodeName)).addClass(this.options.listClass+' '+ this.options.dragClass);this.dragEl.css('width',dragItem.width());dragItem.after(this.placeEl);dragItem[0].parentNode.removeChild(dragItem[0]);dragItem.appendTo(this.dragEl);$(document.body).append(this.dragEl);this.dragEl.css({'left':e.pageX- mouse.offsetX,'top':e.pageY- mouse.offsetY});var i,depth,items=this.dragEl.find(this.options.itemNodeName);for(i=0;i<items.length;i++){depth=$(items[i]).parents(this.options.listNodeName).length;if(depth>this.dragDepth){this.dragDepth=depth;}}},dragStop:function(e)
{var el=this.dragEl.children(this.options.itemNodeName).first();el[0].parentNode.removeChild(el[0]);this.placeEl.replaceWith(el);this.dragEl.remove();this.el.trigger('change');if(this.hasNewRoot){this.dragRootEl.trigger('change');}
this.reset();},dragMove:function(e)
{var list,parent,prev,next,depth,opt=this.options,mouse=this.mouse;this.dragEl.css({'left':e.pageX- mouse.offsetX,'top':e.pageY- mouse.offsetY});mouse.lastX=mouse.nowX;mouse.lastY=mouse.nowY;mouse.nowX=e.pageX;mouse.nowY=e.pageY;mouse.distX=mouse.nowX- mouse.lastX;mouse.distY=mouse.nowY- mouse.lastY;mouse.lastDirX=mouse.dirX;mouse.lastDirY=mouse.dirY;mouse.dirX=mouse.distX===0?0:mouse.distX>0?1:-1;mouse.dirY=mouse.distY===0?0:mouse.distY>0?1:-1;var newAx=Math.abs(mouse.distX)>Math.abs(mouse.distY)?1:0;if(!mouse.moving){mouse.dirAx=newAx;mouse.moving=true;return;}
if(mouse.dirAx!==newAx){mouse.distAxX=0;mouse.distAxY=0;}else{mouse.distAxX+=Math.abs(mouse.distX);if(mouse.dirX!==0&&mouse.dirX!==mouse.lastDirX){mouse.distAxX=0;}
mouse.distAxY+=Math.abs(mouse.distY);if(mouse.dirY!==0&&mouse.dirY!==mouse.lastDirY){mouse.distAxY=0;}}
mouse.dirAx=newAx;if(mouse.dirAx&&mouse.distAxX>=opt.threshold){mouse.distAxX=0;prev=this.placeEl.prev(opt.itemNodeName);if(mouse.distX>0&&prev.length&&!prev.hasClass(opt.collapsedClass)){list=prev.find(opt.listNodeName).last();depth=this.placeEl.parents(opt.listNodeName).length;if(depth+ this.dragDepth<=opt.maxDepth){if(!list.length){list=$('<'+ opt.listNodeName+'/>').addClass(opt.listClass);list.append(this.placeEl);prev.append(list);this.setParent(prev);}else{list=prev.children(opt.listNodeName).last();list.append(this.placeEl);}}}
if(mouse.distX<0){next=this.placeEl.next(opt.itemNodeName);if(!next.length){parent=this.placeEl.parent();this.placeEl.closest(opt.itemNodeName).after(this.placeEl);if(!parent.children().length){this.unsetParent(parent.parent());}}}}
var isEmpty=false;if(!hasPointerEvents){this.dragEl[0].style.visibility='hidden';}
this.pointEl=$(document.elementFromPoint(e.pageX- document.body.scrollLeft,e.pageY-(window.pageYOffset||document.documentElement.scrollTop)));if(!hasPointerEvents){this.dragEl[0].style.visibility='visible';}
if(this.pointEl.hasClass(opt.handleClass)){this.pointEl=this.pointEl.parent(opt.itemNodeName);}
if(this.pointEl.hasClass(opt.emptyClass)){isEmpty=true;}
else if(!this.pointEl.length||!this.pointEl.hasClass(opt.itemClass)){return;}
var pointElRoot=this.pointEl.closest('.'+ opt.rootClass),isNewRoot=this.dragRootEl.data('nestable-id')!==pointElRoot.data('nestable-id');if(!mouse.dirAx||isNewRoot||isEmpty){if(isNewRoot&&opt.group!==pointElRoot.data('nestable-group')){return;}
depth=this.dragDepth- 1+ this.pointEl.parents(opt.listNodeName).length;if(depth>opt.maxDepth){return;}
var before=e.pageY<(this.pointEl.offset().top+ this.pointEl.height()/ 2);
parent=this.placeEl.parent();if(isEmpty){list=$(document.createElement(opt.listNodeName)).addClass(opt.listClass);list.append(this.placeEl);this.pointEl.replaceWith(list);}
else if(before){this.pointEl.before(this.placeEl);}
else{this.pointEl.after(this.placeEl);}
if(!parent.children().length){this.unsetParent(parent.parent());}
if(!this.dragRootEl.find(opt.itemNodeName).length){this.dragRootEl.append('<div class="'+ opt.emptyClass+'"/>');}
if(isNewRoot){this.dragRootEl=pointElRoot;this.hasNewRoot=this.el[0]!==this.dragRootEl[0];}}}};$.fn.nestable=function(params)
{var lists=this,retval=this;lists.each(function()
{var plugin=$(this).data("nestable");if(!plugin){$(this).data("nestable",new Plugin(this,params));$(this).data("nestable-id",new Date().getTime());}else{if(typeof params==='string'&&typeof plugin[params]==='function'){retval=plugin[params]();}}});return retval||lists;};})(window.jQuery||window.Zepto,window,document);
/* Chosen v1.4.0 | (c) 2011-2015 by Harvest | MIT License, https://github.com/harvesthq/chosen/blob/master/LICENSE.md */

(function() {
    var a, AbstractChosen, Chosen, SelectParser, b, c = {}.hasOwnProperty,
        d = function(a, b) {
            function d() {
                this.constructor = a
            }
            for (var e in b) c.call(b, e) && (a[e] = b[e]);
            return d.prototype = b.prototype, a.prototype = new d, a.__super__ = b.prototype, a
        };
    SelectParser = function() {
        function SelectParser() {
            this.options_index = 0, this.parsed = []
        }
        return SelectParser.prototype.add_node = function(a) {
            return "OPTGROUP" === a.nodeName.toUpperCase() ? this.add_group(a) : this.add_option(a)
        }, SelectParser.prototype.add_group = function(a) {
            var b, c, d, e, f, g;
            for (b = this.parsed.length, this.parsed.push({
                    array_index: b,
                    group: !0,
                    label: this.escapeExpression(a.label),
                    title: a.title ? a.title : void 0,
                    children: 0,
                    disabled: a.disabled,
                    classes: a.className
                }), f = a.childNodes, g = [], d = 0, e = f.length; e > d; d++) c = f[d], g.push(this.add_option(c, b, a.disabled));
            return g
        }, SelectParser.prototype.add_option = function(a, b, c) {
            return "OPTION" === a.nodeName.toUpperCase() ? ("" !== a.text ? (null != b && (this.parsed[b].children += 1), this.parsed.push({
                array_index: this.parsed.length,
                options_index: this.options_index,
                value: a.value,
                text: a.text,
                html: a.innerHTML,
                title: a.title ? a.title : void 0,
                selected: a.selected,
                disabled: c === !0 ? c : a.disabled,
                group_array_index: b,
                group_label: null != b ? this.parsed[b].label : null,
                classes: a.className,
                style: a.style.cssText
            })) : this.parsed.push({
                array_index: this.parsed.length,
                options_index: this.options_index,
                empty: !0
            }), this.options_index += 1) : void 0
        }, SelectParser.prototype.escapeExpression = function(a) {
            var b, c;
            return null == a || a === !1 ? "" : /[\&\<\>\"\'\`]/.test(a) ? (b = {
                "<": "&lt;",
                ">": "&gt;",
                '"': "&quot;",
                "'": "&#x27;",
                "`": "&#x60;"
            }, c = /&(?!\w+;)|[\<\>\"\'\`]/g, a.replace(c, function(a) {
                return b[a] || "&amp;"
            })) : a
        }, SelectParser
    }(), SelectParser.select_to_array = function(a) {
        var b, c, d, e, f;
        for (c = new SelectParser, f = a.childNodes, d = 0, e = f.length; e > d; d++) b = f[d], c.add_node(b);
        return c.parsed
    }, AbstractChosen = function() {
        function AbstractChosen(a, b) {
            this.form_field = a, this.options = null != b ? b : {}, AbstractChosen.browser_is_supported() && (this.is_multiple = this.form_field.multiple, this.set_default_text(), this.set_default_values(), this.setup(), this.set_up_html(), this.register_observers(), this.on_ready())
        }
        return AbstractChosen.prototype.set_default_values = function() {
            var a = this;
            return this.click_test_action = function(b) {
                return a.test_active_click(b)
            }, this.activate_action = function(b) {
                return a.activate_field(b)
            }, this.active_field = !1, this.mouse_on_container = !1, this.results_showing = !1, this.result_highlighted = null, this.allow_single_deselect = null != this.options.allow_single_deselect && null != this.form_field.options[0] && "" === this.form_field.options[0].text ? this.options.allow_single_deselect : !1, this.disable_search_threshold = this.options.disable_search_threshold || 0, this.disable_search = this.options.disable_search || !1, this.enable_split_word_search = null != this.options.enable_split_word_search ? this.options.enable_split_word_search : !0, this.group_search = null != this.options.group_search ? this.options.group_search : !0, this.search_contains = this.options.search_contains || !1, this.single_backstroke_delete = null != this.options.single_backstroke_delete ? this.options.single_backstroke_delete : !0, this.max_selected_options = this.options.max_selected_options || 1 / 0, this.inherit_select_classes = this.options.inherit_select_classes || !1, this.display_selected_options = null != this.options.display_selected_options ? this.options.display_selected_options : !0, this.display_disabled_options = null != this.options.display_disabled_options ? this.options.display_disabled_options : !0, this.include_group_label_in_selected = this.options.include_group_label_in_selected || !1
        }, AbstractChosen.prototype.set_default_text = function() {
            return this.default_text = this.form_field.getAttribute("data-placeholder") ? this.form_field.getAttribute("data-placeholder") : this.is_multiple ? this.options.placeholder_text_multiple || this.options.placeholder_text || AbstractChosen.default_multiple_text : this.options.placeholder_text_single || this.options.placeholder_text || AbstractChosen.default_single_text, this.results_none_found = this.form_field.getAttribute("data-no_results_text") || this.options.no_results_text || AbstractChosen.default_no_result_text
        }, AbstractChosen.prototype.choice_label = function(a) {
            return this.include_group_label_in_selected && null != a.group_label ? "<b class='group-name'>" + a.group_label + "</b>" + a.html : a.html
        }, AbstractChosen.prototype.mouse_enter = function() {
            return this.mouse_on_container = !0
        }, AbstractChosen.prototype.mouse_leave = function() {
            return this.mouse_on_container = !1
        }, AbstractChosen.prototype.input_focus = function() {
            var a = this;
            if (this.is_multiple) {
                if (!this.active_field) return setTimeout(function() {
                    return a.container_mousedown()
                }, 50)
            } else if (!this.active_field) return this.activate_field()
        }, AbstractChosen.prototype.input_blur = function() {
            var a = this;
            return this.mouse_on_container ? void 0 : (this.active_field = !1, setTimeout(function() {
                return a.blur_test()
            }, 100))
        }, AbstractChosen.prototype.results_option_build = function(a) {
            var b, c, d, e, f;
            for (b = "", f = this.results_data, d = 0, e = f.length; e > d; d++) c = f[d], b += c.group ? this.result_add_group(c) : this.result_add_option(c), (null != a ? a.first : void 0) && (c.selected && this.is_multiple ? this.choice_build(c) : c.selected && !this.is_multiple && this.single_set_selected_text(c.html));
            return b
        }, AbstractChosen.prototype.result_add_option = function(a) {
            var b, c;
            return a.search_match ? this.include_option_in_results(a) ? (b = [], a.disabled || a.selected && this.is_multiple || b.push("active-result"), !a.disabled || a.selected && this.is_multiple || b.push("disabled-result"), a.selected && b.push("result-selected"), null != a.group_array_index && b.push("group-option"), "" !== a.classes && b.push(a.classes), c = document.createElement("li"), c.className = b.join(" "), c.style.cssText = a.style, c.setAttribute("data-option-array-index", a.array_index), c.innerHTML = a.search_text, a.title && (c.title = a.title), this.outerHTML(c)) : "" : ""
        }, AbstractChosen.prototype.result_add_group = function(a) {
            var b, c;
            return a.search_match || a.group_match ? a.active_options > 0 ? (b = [], b.push("group-result"), a.classes && b.push(a.classes), c = document.createElement("li"), c.className = b.join(" "), c.innerHTML = a.search_text, a.title && (c.title = a.title), this.outerHTML(c)) : "" : ""
        }, AbstractChosen.prototype.results_update_field = function() {
            return this.set_default_text(), this.is_multiple || this.results_reset_cleanup(), this.result_clear_highlight(), this.results_build(), this.results_showing ? this.winnow_results() : void 0
        }, AbstractChosen.prototype.reset_single_select_options = function() {
            var a, b, c, d, e;
            for (d = this.results_data, e = [], b = 0, c = d.length; c > b; b++) a = d[b], a.selected ? e.push(a.selected = !1) : e.push(void 0);
            return e
        }, AbstractChosen.prototype.results_toggle = function() {
            return this.results_showing ? this.results_hide() : this.results_show()
        }, AbstractChosen.prototype.results_search = function() {
            return this.results_showing ? this.winnow_results() : this.results_show()
        }, AbstractChosen.prototype.winnow_results = function() {
            var a, b, c, d, e, f, g, h, i, j, k, l;
            for (this.no_results_clear(), d = 0, f = this.get_search_text(), a = f.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&"), i = new RegExp(a, "i"), c = this.get_search_regex(a), l = this.results_data, j = 0, k = l.length; k > j; j++) b = l[j], b.search_match = !1, e = null, this.include_option_in_results(b) && (b.group && (b.group_match = !1, b.active_options = 0), null != b.group_array_index && this.results_data[b.group_array_index] && (e = this.results_data[b.group_array_index], 0 === e.active_options && e.search_match && (d += 1), e.active_options += 1), (!b.group || this.group_search) && (b.search_text = b.group ? b.label : b.html, b.search_match = this.search_string_match(b.search_text, c), b.search_match && !b.group && (d += 1), b.search_match ? (f.length && (g = b.search_text.search(i), h = b.search_text.substr(0, g + f.length) + "</em>" + b.search_text.substr(g + f.length), b.search_text = h.substr(0, g) + "<em>" + h.substr(g)), null != e && (e.group_match = !0)) : null != b.group_array_index && this.results_data[b.group_array_index].search_match && (b.search_match = !0)));
            return this.result_clear_highlight(), 1 > d && f.length ? (this.update_results_content(""), this.no_results(f)) : (this.update_results_content(this.results_option_build()), this.winnow_results_set_highlight())
        }, AbstractChosen.prototype.get_search_regex = function(a) {
            var b;
            return b = this.search_contains ? "" : "^", new RegExp(b + a, "i")
        }, AbstractChosen.prototype.search_string_match = function(a, b) {
            var c, d, e, f;
            if (b.test(a)) return !0;
            if (this.enable_split_word_search && (a.indexOf(" ") >= 0 || 0 === a.indexOf("[")) && (d = a.replace(/\[|\]/g, "").split(" "), d.length))
                for (e = 0, f = d.length; f > e; e++)
                    if (c = d[e], b.test(c)) return !0
        }, AbstractChosen.prototype.choices_count = function() {
            var a, b, c, d;
            if (null != this.selected_option_count) return this.selected_option_count;
            for (this.selected_option_count = 0, d = this.form_field.options, b = 0, c = d.length; c > b; b++) a = d[b], a.selected && (this.selected_option_count += 1);
            return this.selected_option_count
        }, AbstractChosen.prototype.choices_click = function(a) {
            return a.preventDefault(), this.results_showing || this.is_disabled ? void 0 : this.results_show()
        }, AbstractChosen.prototype.keyup_checker = function(a) {
            var b, c;
            switch (b = null != (c = a.which) ? c : a.keyCode, this.search_field_scale(), b) {
                case 8:
                    if (this.is_multiple && this.backstroke_length < 1 && this.choices_count() > 0) return this.keydown_backstroke();
                    if (!this.pending_backstroke) return this.result_clear_highlight(), this.results_search();
                    break;
                case 13:
                    if (a.preventDefault(), this.results_showing) return this.result_select(a);
                    break;
                case 27:
                    return this.results_showing && this.results_hide(), !0;
                case 9:
                case 38:
                case 40:
                case 16:
                case 91:
                case 17:
                    break;
                default:
                    return this.results_search()
            }
        }, AbstractChosen.prototype.clipboard_event_checker = function() {
            var a = this;
            return setTimeout(function() {
                return a.results_search()
            }, 50)
        }, AbstractChosen.prototype.container_width = function() {
            return null != this.options.width ? this.options.width : "" + this.form_field.offsetWidth + "px"
        }, AbstractChosen.prototype.include_option_in_results = function(a) {
            return this.is_multiple && !this.display_selected_options && a.selected ? !1 : !this.display_disabled_options && a.disabled ? !1 : a.empty ? !1 : !0
        }, AbstractChosen.prototype.search_results_touchstart = function(a) {
            return this.touch_started = !0, this.search_results_mouseover(a)
        }, AbstractChosen.prototype.search_results_touchmove = function(a) {
            return this.touch_started = !1, this.search_results_mouseout(a)
        }, AbstractChosen.prototype.search_results_touchend = function(a) {
            return this.touch_started ? this.search_results_mouseup(a) : void 0
        }, AbstractChosen.prototype.outerHTML = function(a) {
            var b;
            return a.outerHTML ? a.outerHTML : (b = document.createElement("div"), b.appendChild(a), b.innerHTML)
        }, AbstractChosen.browser_is_supported = function() {
            return "Microsoft Internet Explorer" === window.navigator.appName ? document.documentMode >= 8 : /iP(od|hone)/i.test(window.navigator.userAgent) ? !1 : /Android/i.test(window.navigator.userAgent) && /Mobile/i.test(window.navigator.userAgent) ? !1 : !0
        }, AbstractChosen.default_multiple_text = "Select Some Options", AbstractChosen.default_single_text = "Select an Option", AbstractChosen.default_no_result_text = "No results match", AbstractChosen
    }(), a = jQuery, a.fn.extend({
        chosen: function(b) {
            return AbstractChosen.browser_is_supported() ? this.each(function() {
                var c, d;
                c = a(this), d = c.data("chosen"), "destroy" === b && d instanceof Chosen ? d.destroy() : d instanceof Chosen || c.data("chosen", new Chosen(this, b))
            }) : this
        }
    }), Chosen = function(c) {
        function Chosen() {
            return b = Chosen.__super__.constructor.apply(this, arguments)
        }
        return d(Chosen, c), Chosen.prototype.setup = function() {
            return this.form_field_jq = a(this.form_field), this.current_selectedIndex = this.form_field.selectedIndex, this.is_rtl = this.form_field_jq.hasClass("chosen-rtl")
        }, Chosen.prototype.set_up_html = function() {
            var b, c;
            return b = ["chosen-container"], b.push("chosen-container-" + (this.is_multiple ? "multi" : "single")), this.inherit_select_classes && this.form_field.className && b.push(this.form_field.className), this.is_rtl && b.push("chosen-rtl"), c = {
                "class": b.join(" "),
                style: "width: " + this.container_width() + ";",
                title: this.form_field.title
            }, this.form_field.id.length && (c.id = this.form_field.id.replace(/[^\w]/g, "_") + "_chosen"), this.container = a("<div />", c), this.is_multiple ? this.container.html('<ul class="chosen-choices"><li class="search-field"><input type="text" value="' + this.default_text + '" class="default" autocomplete="off" style="width:25px;" /></li></ul><div class="chosen-drop"><ul class="chosen-results"></ul></div>') : this.container.html('<a class="chosen-single chosen-default" tabindex="-1"><span>' + this.default_text + '</span><div><b></b></div></a><div class="chosen-drop"><div class="chosen-search"><input type="text" autocomplete="off" /></div><ul class="chosen-results"></ul></div>'), this.form_field_jq.hide().after(this.container), this.dropdown = this.container.find("div.chosen-drop").first(), this.search_field = this.container.find("input").first(), this.search_results = this.container.find("ul.chosen-results").first(), this.search_field_scale(), this.search_no_results = this.container.find("li.no-results").first(), this.is_multiple ? (this.search_choices = this.container.find("ul.chosen-choices").first(), this.search_container = this.container.find("li.search-field").first()) : (this.search_container = this.container.find("div.chosen-search").first(), this.selected_item = this.container.find(".chosen-single").first()), this.results_build(), this.set_tab_index(), this.set_label_behavior()
        }, Chosen.prototype.on_ready = function() {
            return this.form_field_jq.trigger("chosen:ready", {
                chosen: this
            })
        }, Chosen.prototype.register_observers = function() {
            var a = this;
            return this.container.bind("touchstart.chosen", function(b) {
                a.container_mousedown(b)
            }), this.container.bind("touchend.chosen", function(b) {
                a.container_mouseup(b)
            }), this.container.bind("mousedown.chosen", function(b) {
                a.container_mousedown(b)
            }), this.container.bind("mouseup.chosen", function(b) {
                a.container_mouseup(b)
            }), this.container.bind("mouseenter.chosen", function(b) {
                a.mouse_enter(b)
            }), this.container.bind("mouseleave.chosen", function(b) {
                a.mouse_leave(b)
            }), this.search_results.bind("mouseup.chosen", function(b) {
                a.search_results_mouseup(b)
            }), this.search_results.bind("mouseover.chosen", function(b) {
                a.search_results_mouseover(b)
            }), this.search_results.bind("mouseout.chosen", function(b) {
                a.search_results_mouseout(b)
            }), this.search_results.bind("mousewheel.chosen DOMMouseScroll.chosen", function(b) {
                a.search_results_mousewheel(b)
            }), this.search_results.bind("touchstart.chosen", function(b) {
                a.search_results_touchstart(b)
            }), this.search_results.bind("touchmove.chosen", function(b) {
                a.search_results_touchmove(b)
            }), this.search_results.bind("touchend.chosen", function(b) {
                a.search_results_touchend(b)
            }), this.form_field_jq.bind("chosen:updated.chosen", function(b) {
                a.results_update_field(b)
            }), this.form_field_jq.bind("chosen:activate.chosen", function(b) {
                a.activate_field(b)
            }), this.form_field_jq.bind("chosen:open.chosen", function(b) {
                a.container_mousedown(b)
            }), this.form_field_jq.bind("chosen:close.chosen", function(b) {
                a.input_blur(b)
            }), this.search_field.bind("blur.chosen", function(b) {
                a.input_blur(b)
            }), this.search_field.bind("keyup.chosen", function(b) {
                a.keyup_checker(b)
            }), this.search_field.bind("keydown.chosen", function(b) {
                a.keydown_checker(b)
            }), this.search_field.bind("focus.chosen", function(b) {
                a.input_focus(b)
            }), this.search_field.bind("cut.chosen", function(b) {
                a.clipboard_event_checker(b)
            }), this.search_field.bind("paste.chosen", function(b) {
                a.clipboard_event_checker(b)
            }), this.is_multiple ? this.search_choices.bind("click.chosen", function(b) {
                a.choices_click(b)
            }) : this.container.bind("click.chosen", function(a) {
                a.preventDefault()
            })
        }, Chosen.prototype.destroy = function() {
            return a(this.container[0].ownerDocument).unbind("click.chosen", this.click_test_action), this.search_field[0].tabIndex && (this.form_field_jq[0].tabIndex = this.search_field[0].tabIndex), this.container.remove(), this.form_field_jq.removeData("chosen"), this.form_field_jq.show()
        }, Chosen.prototype.search_field_disabled = function() {
            return this.is_disabled = this.form_field_jq[0].disabled, this.is_disabled ? (this.container.addClass("chosen-disabled"), this.search_field[0].disabled = !0, this.is_multiple || this.selected_item.unbind("focus.chosen", this.activate_action), this.close_field()) : (this.container.removeClass("chosen-disabled"), this.search_field[0].disabled = !1, this.is_multiple ? void 0 : this.selected_item.bind("focus.chosen", this.activate_action))
        }, Chosen.prototype.container_mousedown = function(b) {
            return this.is_disabled || (b && "mousedown" === b.type && !this.results_showing && b.preventDefault(), null != b && a(b.target).hasClass("search-choice-close")) ? void 0 : (this.active_field ? this.is_multiple || !b || a(b.target)[0] !== this.selected_item[0] && !a(b.target).parents("a.chosen-single").length || (b.preventDefault(), this.results_toggle()) : (this.is_multiple && this.search_field.val(""), a(this.container[0].ownerDocument).bind("click.chosen", this.click_test_action), this.results_show()), this.activate_field())
        }, Chosen.prototype.container_mouseup = function(a) {
            return "ABBR" !== a.target.nodeName || this.is_disabled ? void 0 : this.results_reset(a)
        }, Chosen.prototype.search_results_mousewheel = function(a) {
            var b;
            return a.originalEvent && (b = a.originalEvent.deltaY || -a.originalEvent.wheelDelta || a.originalEvent.detail), null != b ? (a.preventDefault(), "DOMMouseScroll" === a.type && (b = 40 * b), this.search_results.scrollTop(b + this.search_results.scrollTop())) : void 0
        }, Chosen.prototype.blur_test = function() {
            return !this.active_field && this.container.hasClass("chosen-container-active") ? this.close_field() : void 0
        }, Chosen.prototype.close_field = function() {
            return a(this.container[0].ownerDocument).unbind("click.chosen", this.click_test_action), this.active_field = !1, this.results_hide(), this.container.removeClass("chosen-container-active"), this.clear_backstroke(), this.show_search_field_default(), this.search_field_scale()
        }, Chosen.prototype.activate_field = function() {
            return this.container.addClass("chosen-container-active"), this.active_field = !0, this.search_field.val(this.search_field.val()), this.search_field.focus()
        }, Chosen.prototype.test_active_click = function(b) {
            var c;
            return c = a(b.target).closest(".chosen-container"), c.length && this.container[0] === c[0] ? this.active_field = !0 : this.close_field()
        }, Chosen.prototype.results_build = function() {
            return this.parsing = !0, this.selected_option_count = null, this.results_data = SelectParser.select_to_array(this.form_field), this.is_multiple ? this.search_choices.find("li.search-choice").remove() : this.is_multiple || (this.single_set_selected_text(), this.disable_search || this.form_field.options.length <= this.disable_search_threshold ? (this.search_field[0].readOnly = !0, this.container.addClass("chosen-container-single-nosearch")) : (this.search_field[0].readOnly = !1, this.container.removeClass("chosen-container-single-nosearch"))), this.update_results_content(this.results_option_build({
                first: !0
            })), this.search_field_disabled(), this.show_search_field_default(), this.search_field_scale(), this.parsing = !1
        }, Chosen.prototype.result_do_highlight = function(a) {
            var b, c, d, e, f;
            if (a.length) {
                if (this.result_clear_highlight(), this.result_highlight = a, this.result_highlight.addClass("highlighted"), d = parseInt(this.search_results.css("maxHeight"), 10), f = this.search_results.scrollTop(), e = d + f, c = this.result_highlight.position().top + this.search_results.scrollTop(), b = c + this.result_highlight.outerHeight(), b >= e) return this.search_results.scrollTop(b - d > 0 ? b - d : 0);
                if (f > c) return this.search_results.scrollTop(c)
            }
        }, Chosen.prototype.result_clear_highlight = function() {
            return this.result_highlight && this.result_highlight.removeClass("highlighted"), this.result_highlight = null
        }, Chosen.prototype.results_show = function() {
            return this.is_multiple && this.max_selected_options <= this.choices_count() ? (this.form_field_jq.trigger("chosen:maxselected", {
                chosen: this
            }), !1) : (this.container.addClass("chosen-with-drop"), this.results_showing = !0, this.search_field.focus(), this.search_field.val(this.search_field.val()), this.winnow_results(), this.form_field_jq.trigger("chosen:showing_dropdown", {
                chosen: this
            }))
        }, Chosen.prototype.update_results_content = function(a) {
            return this.search_results.html(a)
        }, Chosen.prototype.results_hide = function() {
            return this.results_showing && (this.result_clear_highlight(), this.container.removeClass("chosen-with-drop"), this.form_field_jq.trigger("chosen:hiding_dropdown", {
                chosen: this
            })), this.results_showing = !1
        }, Chosen.prototype.set_tab_index = function() {
            var a;
            return this.form_field.tabIndex ? (a = this.form_field.tabIndex, this.form_field.tabIndex = -1, this.search_field[0].tabIndex = a) : void 0
        }, Chosen.prototype.set_label_behavior = function() {
            var b = this;
            return this.form_field_label = this.form_field_jq.parents("label"), !this.form_field_label.length && this.form_field.id.length && (this.form_field_label = a("label[for='" + this.form_field.id + "']")), this.form_field_label.length > 0 ? this.form_field_label.bind("click.chosen", function(a) {
                return b.is_multiple ? b.container_mousedown(a) : b.activate_field()
            }) : void 0
        }, Chosen.prototype.show_search_field_default = function() {
            return this.is_multiple && this.choices_count() < 1 && !this.active_field ? (this.search_field.val(this.default_text), this.search_field.addClass("default")) : (this.search_field.val(""), this.search_field.removeClass("default"))
        }, Chosen.prototype.search_results_mouseup = function(b) {
            var c;
            return c = a(b.target).hasClass("active-result") ? a(b.target) : a(b.target).parents(".active-result").first(), c.length ? (this.result_highlight = c, this.result_select(b), this.search_field.focus()) : void 0
        }, Chosen.prototype.search_results_mouseover = function(b) {
            var c;
            return c = a(b.target).hasClass("active-result") ? a(b.target) : a(b.target).parents(".active-result").first(), c ? this.result_do_highlight(c) : void 0
        }, Chosen.prototype.search_results_mouseout = function(b) {
            return a(b.target).hasClass("active-result") ? this.result_clear_highlight() : void 0
        }, Chosen.prototype.choice_build = function(b) {
            var c, d, e = this;
            return c = a("<li />", {
                "class": "search-choice"
            }).html("<span>" + this.choice_label(b) + "</span>"), b.disabled ? c.addClass("search-choice-disabled") : (d = a("<a />", {
                "class": "search-choice-close",
                "data-option-array-index": b.array_index
            }), d.bind("click.chosen", function(a) {
                return e.choice_destroy_link_click(a)
            }), c.append(d)), this.search_container.before(c)
        }, Chosen.prototype.choice_destroy_link_click = function(b) {
            return b.preventDefault(), b.stopPropagation(), this.is_disabled ? void 0 : this.choice_destroy(a(b.target))
        }, Chosen.prototype.choice_destroy = function(a) {
            return this.result_deselect(a[0].getAttribute("data-option-array-index")) ? (this.show_search_field_default(), this.is_multiple && this.choices_count() > 0 && this.search_field.val().length < 1 && this.results_hide(), a.parents("li").first().remove(), this.search_field_scale()) : void 0
        }, Chosen.prototype.results_reset = function() {
            return this.reset_single_select_options(), this.form_field.options[0].selected = !0, this.single_set_selected_text(), this.show_search_field_default(), this.results_reset_cleanup(), this.form_field_jq.trigger("change"), this.active_field ? this.results_hide() : void 0
        }, Chosen.prototype.results_reset_cleanup = function() {
            return this.current_selectedIndex = this.form_field.selectedIndex, this.selected_item.find("abbr").remove()
        }, Chosen.prototype.result_select = function(a) {
            var b, c;
            return this.result_highlight ? (b = this.result_highlight, this.result_clear_highlight(), this.is_multiple && this.max_selected_options <= this.choices_count() ? (this.form_field_jq.trigger("chosen:maxselected", {
                chosen: this
            }), !1) : (this.is_multiple ? b.removeClass("active-result") : this.reset_single_select_options(), c = this.results_data[b[0].getAttribute("data-option-array-index")], c.selected = !0, this.form_field.options[c.options_index].selected = !0, this.selected_option_count = null, this.is_multiple ? this.choice_build(c) : this.single_set_selected_text(this.choice_label(c)), (a.metaKey || a.ctrlKey) && this.is_multiple || this.results_hide(), this.search_field.val(""), (this.is_multiple || this.form_field.selectedIndex !== this.current_selectedIndex) && this.form_field_jq.trigger("change", {
                selected: this.form_field.options[c.options_index].value
            }), this.current_selectedIndex = this.form_field.selectedIndex, a.preventDefault(), this.search_field_scale())) : void 0
        }, Chosen.prototype.single_set_selected_text = function(a) {
            return null == a && (a = this.default_text), a === this.default_text ? this.selected_item.addClass("chosen-default") : (this.single_deselect_control_build(), this.selected_item.removeClass("chosen-default")), this.selected_item.find("span").html(a)
        }, Chosen.prototype.result_deselect = function(a) {
            var b;
            return b = this.results_data[a], this.form_field.options[b.options_index].disabled ? !1 : (b.selected = !1, this.form_field.options[b.options_index].selected = !1, this.selected_option_count = null, this.result_clear_highlight(), this.results_showing && this.winnow_results(), this.form_field_jq.trigger("change", {
                deselected: this.form_field.options[b.options_index].value
            }), this.search_field_scale(), !0)
        }, Chosen.prototype.single_deselect_control_build = function() {
            return this.allow_single_deselect ? (this.selected_item.find("abbr").length || this.selected_item.find("span").first().after('<abbr class="search-choice-close"></abbr>'), this.selected_item.addClass("chosen-single-with-deselect")) : void 0
        }, Chosen.prototype.get_search_text = function() {
            return this.search_field.val() === this.default_text ? "" : a("<div/>").text(a.trim(this.search_field.val())).html()
        }, Chosen.prototype.winnow_results_set_highlight = function() {
            var a, b;
            return b = this.is_multiple ? [] : this.search_results.find(".result-selected.active-result"), a = b.length ? b.first() : this.search_results.find(".active-result").first(), null != a ? this.result_do_highlight(a) : void 0
        }, Chosen.prototype.no_results = function(b) {
            var c;
            return c = a('<li class="no-results">' + this.results_none_found + ' "<span></span>"</li>'), c.find("span").first().html(b), this.search_results.append(c), this.form_field_jq.trigger("chosen:no_results", {
                chosen: this
            })
        }, Chosen.prototype.no_results_clear = function() {
            return this.search_results.find(".no-results").remove()
        }, Chosen.prototype.keydown_arrow = function() {
            var a;
            return this.results_showing && this.result_highlight ? (a = this.result_highlight.nextAll("li.active-result").first()) ? this.result_do_highlight(a) : void 0 : this.results_show()
        }, Chosen.prototype.keyup_arrow = function() {
            var a;
            return this.results_showing || this.is_multiple ? this.result_highlight ? (a = this.result_highlight.prevAll("li.active-result"), a.length ? this.result_do_highlight(a.first()) : (this.choices_count() > 0 && this.results_hide(), this.result_clear_highlight())) : void 0 : this.results_show()
        }, Chosen.prototype.keydown_backstroke = function() {
            var a;
            return this.pending_backstroke ? (this.choice_destroy(this.pending_backstroke.find("a").first()), this.clear_backstroke()) : (a = this.search_container.siblings("li.search-choice").last(), a.length && !a.hasClass("search-choice-disabled") ? (this.pending_backstroke = a, this.single_backstroke_delete ? this.keydown_backstroke() : this.pending_backstroke.addClass("search-choice-focus")) : void 0)
        }, Chosen.prototype.clear_backstroke = function() {
            return this.pending_backstroke && this.pending_backstroke.removeClass("search-choice-focus"), this.pending_backstroke = null
        }, Chosen.prototype.keydown_checker = function(a) {
            var b, c;
            switch (b = null != (c = a.which) ? c : a.keyCode, this.search_field_scale(), 8 !== b && this.pending_backstroke && this.clear_backstroke(), b) {
                case 8:
                    this.backstroke_length = this.search_field.val().length;
                    break;
                case 9:
                    this.results_showing && !this.is_multiple && this.result_select(a), this.mouse_on_container = !1;
                    break;
                case 13:
                    this.results_showing && a.preventDefault();
                    break;
                case 32:
                    this.disable_search && a.preventDefault();
                    break;
                case 38:
                    a.preventDefault(), this.keyup_arrow();
                    break;
                case 40:
                    a.preventDefault(), this.keydown_arrow()
            }
        }, Chosen.prototype.search_field_scale = function() {
            var b, c, d, e, f, g, h, i, j;
            if (this.is_multiple) {
                for (d = 0, h = 0, f = "position:absolute; left: -1000px; top: -1000px; display:none;", g = ["font-size", "font-style", "font-weight", "font-family", "line-height", "text-transform", "letter-spacing"], i = 0, j = g.length; j > i; i++) e = g[i], f += e + ":" + this.search_field.css(e) + ";";
                return b = a("<div />", {
                    style: f
                }), b.text(this.search_field.val()), a("body").append(b), h = b.width() + 25, b.remove(), c = this.container.outerWidth(), h > c - 10 && (h = c - 10), this.search_field.css({
                    width: h + "px"
                })
            }
        }, Chosen
    }(AbstractChosen)
}).call(this);
//! moment.js
//! version : 2.9.0
//! authors : Tim Wood, Iskren Chernev, Moment.js contributors
//! license : MIT
//! momentjs.com
(function(a){function b(a,b,c){switch(arguments.length){case 2:return null!=a?a:b;case 3:return null!=a?a:null!=b?b:c;default:throw new Error("Implement me")}}function c(a,b){return Bb.call(a,b)}function d(){return{empty:!1,unusedTokens:[],unusedInput:[],overflow:-2,charsLeftOver:0,nullInput:!1,invalidMonth:null,invalidFormat:!1,userInvalidated:!1,iso:!1}}function e(a){vb.suppressDeprecationWarnings===!1&&"undefined"!=typeof console&&console.warn&&console.warn("Deprecation warning: "+a)}function f(a,b){var c=!0;return o(function(){return c&&(e(a),c=!1),b.apply(this,arguments)},b)}function g(a,b){sc[a]||(e(b),sc[a]=!0)}function h(a,b){return function(c){return r(a.call(this,c),b)}}function i(a,b){return function(c){return this.localeData().ordinal(a.call(this,c),b)}}function j(a,b){var c,d,e=12*(b.year()-a.year())+(b.month()-a.month()),f=a.clone().add(e,"months");return 0>b-f?(c=a.clone().add(e-1,"months"),d=(b-f)/(f-c)):(c=a.clone().add(e+1,"months"),d=(b-f)/(c-f)),-(e+d)}function k(a,b,c){var d;return null==c?b:null!=a.meridiemHour?a.meridiemHour(b,c):null!=a.isPM?(d=a.isPM(c),d&&12>b&&(b+=12),d||12!==b||(b=0),b):b}function l(){}function m(a,b){b!==!1&&H(a),p(this,a),this._d=new Date(+a._d),uc===!1&&(uc=!0,vb.updateOffset(this),uc=!1)}function n(a){var b=A(a),c=b.year||0,d=b.quarter||0,e=b.month||0,f=b.week||0,g=b.day||0,h=b.hour||0,i=b.minute||0,j=b.second||0,k=b.millisecond||0;this._milliseconds=+k+1e3*j+6e4*i+36e5*h,this._days=+g+7*f,this._months=+e+3*d+12*c,this._data={},this._locale=vb.localeData(),this._bubble()}function o(a,b){for(var d in b)c(b,d)&&(a[d]=b[d]);return c(b,"toString")&&(a.toString=b.toString),c(b,"valueOf")&&(a.valueOf=b.valueOf),a}function p(a,b){var c,d,e;if("undefined"!=typeof b._isAMomentObject&&(a._isAMomentObject=b._isAMomentObject),"undefined"!=typeof b._i&&(a._i=b._i),"undefined"!=typeof b._f&&(a._f=b._f),"undefined"!=typeof b._l&&(a._l=b._l),"undefined"!=typeof b._strict&&(a._strict=b._strict),"undefined"!=typeof b._tzm&&(a._tzm=b._tzm),"undefined"!=typeof b._isUTC&&(a._isUTC=b._isUTC),"undefined"!=typeof b._offset&&(a._offset=b._offset),"undefined"!=typeof b._pf&&(a._pf=b._pf),"undefined"!=typeof b._locale&&(a._locale=b._locale),Kb.length>0)for(c in Kb)d=Kb[c],e=b[d],"undefined"!=typeof e&&(a[d]=e);return a}function q(a){return 0>a?Math.ceil(a):Math.floor(a)}function r(a,b,c){for(var d=""+Math.abs(a),e=a>=0;d.length<b;)d="0"+d;return(e?c?"+":"":"-")+d}function s(a,b){var c={milliseconds:0,months:0};return c.months=b.month()-a.month()+12*(b.year()-a.year()),a.clone().add(c.months,"M").isAfter(b)&&--c.months,c.milliseconds=+b-+a.clone().add(c.months,"M"),c}function t(a,b){var c;return b=M(b,a),a.isBefore(b)?c=s(a,b):(c=s(b,a),c.milliseconds=-c.milliseconds,c.months=-c.months),c}function u(a,b){return function(c,d){var e,f;return null===d||isNaN(+d)||(g(b,"moment()."+b+"(period, number) is deprecated. Please use moment()."+b+"(number, period)."),f=c,c=d,d=f),c="string"==typeof c?+c:c,e=vb.duration(c,d),v(this,e,a),this}}function v(a,b,c,d){var e=b._milliseconds,f=b._days,g=b._months;d=null==d?!0:d,e&&a._d.setTime(+a._d+e*c),f&&pb(a,"Date",ob(a,"Date")+f*c),g&&nb(a,ob(a,"Month")+g*c),d&&vb.updateOffset(a,f||g)}function w(a){return"[object Array]"===Object.prototype.toString.call(a)}function x(a){return"[object Date]"===Object.prototype.toString.call(a)||a instanceof Date}function y(a,b,c){var d,e=Math.min(a.length,b.length),f=Math.abs(a.length-b.length),g=0;for(d=0;e>d;d++)(c&&a[d]!==b[d]||!c&&C(a[d])!==C(b[d]))&&g++;return g+f}function z(a){if(a){var b=a.toLowerCase().replace(/(.)s$/,"$1");a=lc[a]||mc[b]||b}return a}function A(a){var b,d,e={};for(d in a)c(a,d)&&(b=z(d),b&&(e[b]=a[d]));return e}function B(b){var c,d;if(0===b.indexOf("week"))c=7,d="day";else{if(0!==b.indexOf("month"))return;c=12,d="month"}vb[b]=function(e,f){var g,h,i=vb._locale[b],j=[];if("number"==typeof e&&(f=e,e=a),h=function(a){var b=vb().utc().set(d,a);return i.call(vb._locale,b,e||"")},null!=f)return h(f);for(g=0;c>g;g++)j.push(h(g));return j}}function C(a){var b=+a,c=0;return 0!==b&&isFinite(b)&&(c=b>=0?Math.floor(b):Math.ceil(b)),c}function D(a,b){return new Date(Date.UTC(a,b+1,0)).getUTCDate()}function E(a,b,c){return jb(vb([a,11,31+b-c]),b,c).week}function F(a){return G(a)?366:365}function G(a){return a%4===0&&a%100!==0||a%400===0}function H(a){var b;a._a&&-2===a._pf.overflow&&(b=a._a[Db]<0||a._a[Db]>11?Db:a._a[Eb]<1||a._a[Eb]>D(a._a[Cb],a._a[Db])?Eb:a._a[Fb]<0||a._a[Fb]>24||24===a._a[Fb]&&(0!==a._a[Gb]||0!==a._a[Hb]||0!==a._a[Ib])?Fb:a._a[Gb]<0||a._a[Gb]>59?Gb:a._a[Hb]<0||a._a[Hb]>59?Hb:a._a[Ib]<0||a._a[Ib]>999?Ib:-1,a._pf._overflowDayOfYear&&(Cb>b||b>Eb)&&(b=Eb),a._pf.overflow=b)}function I(b){return null==b._isValid&&(b._isValid=!isNaN(b._d.getTime())&&b._pf.overflow<0&&!b._pf.empty&&!b._pf.invalidMonth&&!b._pf.nullInput&&!b._pf.invalidFormat&&!b._pf.userInvalidated,b._strict&&(b._isValid=b._isValid&&0===b._pf.charsLeftOver&&0===b._pf.unusedTokens.length&&b._pf.bigHour===a)),b._isValid}function J(a){return a?a.toLowerCase().replace("_","-"):a}function K(a){for(var b,c,d,e,f=0;f<a.length;){for(e=J(a[f]).split("-"),b=e.length,c=J(a[f+1]),c=c?c.split("-"):null;b>0;){if(d=L(e.slice(0,b).join("-")))return d;if(c&&c.length>=b&&y(e,c,!0)>=b-1)break;b--}f++}return null}function L(a){var b=null;if(!Jb[a]&&Lb)try{b=vb.locale(),require("./locale/"+a),vb.locale(b)}catch(c){}return Jb[a]}function M(a,b){var c,d;return b._isUTC?(c=b.clone(),d=(vb.isMoment(a)||x(a)?+a:+vb(a))-+c,c._d.setTime(+c._d+d),vb.updateOffset(c,!1),c):vb(a).local()}function N(a){return a.match(/\[[\s\S]/)?a.replace(/^\[|\]$/g,""):a.replace(/\\/g,"")}function O(a){var b,c,d=a.match(Pb);for(b=0,c=d.length;c>b;b++)d[b]=rc[d[b]]?rc[d[b]]:N(d[b]);return function(e){var f="";for(b=0;c>b;b++)f+=d[b]instanceof Function?d[b].call(e,a):d[b];return f}}function P(a,b){return a.isValid()?(b=Q(b,a.localeData()),nc[b]||(nc[b]=O(b)),nc[b](a)):a.localeData().invalidDate()}function Q(a,b){function c(a){return b.longDateFormat(a)||a}var d=5;for(Qb.lastIndex=0;d>=0&&Qb.test(a);)a=a.replace(Qb,c),Qb.lastIndex=0,d-=1;return a}function R(a,b){var c,d=b._strict;switch(a){case"Q":return _b;case"DDDD":return bc;case"YYYY":case"GGGG":case"gggg":return d?cc:Tb;case"Y":case"G":case"g":return ec;case"YYYYYY":case"YYYYY":case"GGGGG":case"ggggg":return d?dc:Ub;case"S":if(d)return _b;case"SS":if(d)return ac;case"SSS":if(d)return bc;case"DDD":return Sb;case"MMM":case"MMMM":case"dd":case"ddd":case"dddd":return Wb;case"a":case"A":return b._locale._meridiemParse;case"x":return Zb;case"X":return $b;case"Z":case"ZZ":return Xb;case"T":return Yb;case"SSSS":return Vb;case"MM":case"DD":case"YY":case"GG":case"gg":case"HH":case"hh":case"mm":case"ss":case"ww":case"WW":return d?ac:Rb;case"M":case"D":case"d":case"H":case"h":case"m":case"s":case"w":case"W":case"e":case"E":return Rb;case"Do":return d?b._locale._ordinalParse:b._locale._ordinalParseLenient;default:return c=new RegExp($(Z(a.replace("\\","")),"i"))}}function S(a){a=a||"";var b=a.match(Xb)||[],c=b[b.length-1]||[],d=(c+"").match(jc)||["-",0,0],e=+(60*d[1])+C(d[2]);return"+"===d[0]?e:-e}function T(a,b,c){var d,e=c._a;switch(a){case"Q":null!=b&&(e[Db]=3*(C(b)-1));break;case"M":case"MM":null!=b&&(e[Db]=C(b)-1);break;case"MMM":case"MMMM":d=c._locale.monthsParse(b,a,c._strict),null!=d?e[Db]=d:c._pf.invalidMonth=b;break;case"D":case"DD":null!=b&&(e[Eb]=C(b));break;case"Do":null!=b&&(e[Eb]=C(parseInt(b.match(/\d{1,2}/)[0],10)));break;case"DDD":case"DDDD":null!=b&&(c._dayOfYear=C(b));break;case"YY":e[Cb]=vb.parseTwoDigitYear(b);break;case"YYYY":case"YYYYY":case"YYYYYY":e[Cb]=C(b);break;case"a":case"A":c._meridiem=b;break;case"h":case"hh":c._pf.bigHour=!0;case"H":case"HH":e[Fb]=C(b);break;case"m":case"mm":e[Gb]=C(b);break;case"s":case"ss":e[Hb]=C(b);break;case"S":case"SS":case"SSS":case"SSSS":e[Ib]=C(1e3*("0."+b));break;case"x":c._d=new Date(C(b));break;case"X":c._d=new Date(1e3*parseFloat(b));break;case"Z":case"ZZ":c._useUTC=!0,c._tzm=S(b);break;case"dd":case"ddd":case"dddd":d=c._locale.weekdaysParse(b),null!=d?(c._w=c._w||{},c._w.d=d):c._pf.invalidWeekday=b;break;case"w":case"ww":case"W":case"WW":case"d":case"e":case"E":a=a.substr(0,1);case"gggg":case"GGGG":case"GGGGG":a=a.substr(0,2),b&&(c._w=c._w||{},c._w[a]=C(b));break;case"gg":case"GG":c._w=c._w||{},c._w[a]=vb.parseTwoDigitYear(b)}}function U(a){var c,d,e,f,g,h,i;c=a._w,null!=c.GG||null!=c.W||null!=c.E?(g=1,h=4,d=b(c.GG,a._a[Cb],jb(vb(),1,4).year),e=b(c.W,1),f=b(c.E,1)):(g=a._locale._week.dow,h=a._locale._week.doy,d=b(c.gg,a._a[Cb],jb(vb(),g,h).year),e=b(c.w,1),null!=c.d?(f=c.d,g>f&&++e):f=null!=c.e?c.e+g:g),i=kb(d,e,f,h,g),a._a[Cb]=i.year,a._dayOfYear=i.dayOfYear}function V(a){var c,d,e,f,g=[];if(!a._d){for(e=X(a),a._w&&null==a._a[Eb]&&null==a._a[Db]&&U(a),a._dayOfYear&&(f=b(a._a[Cb],e[Cb]),a._dayOfYear>F(f)&&(a._pf._overflowDayOfYear=!0),d=fb(f,0,a._dayOfYear),a._a[Db]=d.getUTCMonth(),a._a[Eb]=d.getUTCDate()),c=0;3>c&&null==a._a[c];++c)a._a[c]=g[c]=e[c];for(;7>c;c++)a._a[c]=g[c]=null==a._a[c]?2===c?1:0:a._a[c];24===a._a[Fb]&&0===a._a[Gb]&&0===a._a[Hb]&&0===a._a[Ib]&&(a._nextDay=!0,a._a[Fb]=0),a._d=(a._useUTC?fb:eb).apply(null,g),null!=a._tzm&&a._d.setUTCMinutes(a._d.getUTCMinutes()-a._tzm),a._nextDay&&(a._a[Fb]=24)}}function W(a){var b;a._d||(b=A(a._i),a._a=[b.year,b.month,b.day||b.date,b.hour,b.minute,b.second,b.millisecond],V(a))}function X(a){var b=new Date;return a._useUTC?[b.getUTCFullYear(),b.getUTCMonth(),b.getUTCDate()]:[b.getFullYear(),b.getMonth(),b.getDate()]}function Y(b){if(b._f===vb.ISO_8601)return void ab(b);b._a=[],b._pf.empty=!0;var c,d,e,f,g,h=""+b._i,i=h.length,j=0;for(e=Q(b._f,b._locale).match(Pb)||[],c=0;c<e.length;c++)f=e[c],d=(h.match(R(f,b))||[])[0],d&&(g=h.substr(0,h.indexOf(d)),g.length>0&&b._pf.unusedInput.push(g),h=h.slice(h.indexOf(d)+d.length),j+=d.length),rc[f]?(d?b._pf.empty=!1:b._pf.unusedTokens.push(f),T(f,d,b)):b._strict&&!d&&b._pf.unusedTokens.push(f);b._pf.charsLeftOver=i-j,h.length>0&&b._pf.unusedInput.push(h),b._pf.bigHour===!0&&b._a[Fb]<=12&&(b._pf.bigHour=a),b._a[Fb]=k(b._locale,b._a[Fb],b._meridiem),V(b),H(b)}function Z(a){return a.replace(/\\(\[)|\\(\])|\[([^\]\[]*)\]|\\(.)/g,function(a,b,c,d,e){return b||c||d||e})}function $(a){return a.replace(/[-\/\\^$*+?.()|[\]{}]/g,"\\$&")}function _(a){var b,c,e,f,g;if(0===a._f.length)return a._pf.invalidFormat=!0,void(a._d=new Date(0/0));for(f=0;f<a._f.length;f++)g=0,b=p({},a),null!=a._useUTC&&(b._useUTC=a._useUTC),b._pf=d(),b._f=a._f[f],Y(b),I(b)&&(g+=b._pf.charsLeftOver,g+=10*b._pf.unusedTokens.length,b._pf.score=g,(null==e||e>g)&&(e=g,c=b));o(a,c||b)}function ab(a){var b,c,d=a._i,e=fc.exec(d);if(e){for(a._pf.iso=!0,b=0,c=hc.length;c>b;b++)if(hc[b][1].exec(d)){a._f=hc[b][0]+(e[6]||" ");break}for(b=0,c=ic.length;c>b;b++)if(ic[b][1].exec(d)){a._f+=ic[b][0];break}d.match(Xb)&&(a._f+="Z"),Y(a)}else a._isValid=!1}function bb(a){ab(a),a._isValid===!1&&(delete a._isValid,vb.createFromInputFallback(a))}function cb(a,b){var c,d=[];for(c=0;c<a.length;++c)d.push(b(a[c],c));return d}function db(b){var c,d=b._i;d===a?b._d=new Date:x(d)?b._d=new Date(+d):null!==(c=Mb.exec(d))?b._d=new Date(+c[1]):"string"==typeof d?bb(b):w(d)?(b._a=cb(d.slice(0),function(a){return parseInt(a,10)}),V(b)):"object"==typeof d?W(b):"number"==typeof d?b._d=new Date(d):vb.createFromInputFallback(b)}function eb(a,b,c,d,e,f,g){var h=new Date(a,b,c,d,e,f,g);return 1970>a&&h.setFullYear(a),h}function fb(a){var b=new Date(Date.UTC.apply(null,arguments));return 1970>a&&b.setUTCFullYear(a),b}function gb(a,b){if("string"==typeof a)if(isNaN(a)){if(a=b.weekdaysParse(a),"number"!=typeof a)return null}else a=parseInt(a,10);return a}function hb(a,b,c,d,e){return e.relativeTime(b||1,!!c,a,d)}function ib(a,b,c){var d=vb.duration(a).abs(),e=Ab(d.as("s")),f=Ab(d.as("m")),g=Ab(d.as("h")),h=Ab(d.as("d")),i=Ab(d.as("M")),j=Ab(d.as("y")),k=e<oc.s&&["s",e]||1===f&&["m"]||f<oc.m&&["mm",f]||1===g&&["h"]||g<oc.h&&["hh",g]||1===h&&["d"]||h<oc.d&&["dd",h]||1===i&&["M"]||i<oc.M&&["MM",i]||1===j&&["y"]||["yy",j];return k[2]=b,k[3]=+a>0,k[4]=c,hb.apply({},k)}function jb(a,b,c){var d,e=c-b,f=c-a.day();return f>e&&(f-=7),e-7>f&&(f+=7),d=vb(a).add(f,"d"),{week:Math.ceil(d.dayOfYear()/7),year:d.year()}}function kb(a,b,c,d,e){var f,g,h=fb(a,0,1).getUTCDay();return h=0===h?7:h,c=null!=c?c:e,f=e-h+(h>d?7:0)-(e>h?7:0),g=7*(b-1)+(c-e)+f+1,{year:g>0?a:a-1,dayOfYear:g>0?g:F(a-1)+g}}function lb(b){var c,d=b._i,e=b._f;return b._locale=b._locale||vb.localeData(b._l),null===d||e===a&&""===d?vb.invalid({nullInput:!0}):("string"==typeof d&&(b._i=d=b._locale.preparse(d)),vb.isMoment(d)?new m(d,!0):(e?w(e)?_(b):Y(b):db(b),c=new m(b),c._nextDay&&(c.add(1,"d"),c._nextDay=a),c))}function mb(a,b){var c,d;if(1===b.length&&w(b[0])&&(b=b[0]),!b.length)return vb();for(c=b[0],d=1;d<b.length;++d)b[d][a](c)&&(c=b[d]);return c}function nb(a,b){var c;return"string"==typeof b&&(b=a.localeData().monthsParse(b),"number"!=typeof b)?a:(c=Math.min(a.date(),D(a.year(),b)),a._d["set"+(a._isUTC?"UTC":"")+"Month"](b,c),a)}function ob(a,b){return a._d["get"+(a._isUTC?"UTC":"")+b]()}function pb(a,b,c){return"Month"===b?nb(a,c):a._d["set"+(a._isUTC?"UTC":"")+b](c)}function qb(a,b){return function(c){return null!=c?(pb(this,a,c),vb.updateOffset(this,b),this):ob(this,a)}}function rb(a){return 400*a/146097}function sb(a){return 146097*a/400}function tb(a){vb.duration.fn[a]=function(){return this._data[a]}}function ub(a){"undefined"==typeof ender&&(wb=zb.moment,zb.moment=a?f("Accessing Moment through the global scope is deprecated, and will be removed in an upcoming release.",vb):vb)}for(var vb,wb,xb,yb="2.9.0",zb="undefined"==typeof global||"undefined"!=typeof window&&window!==global.window?this:global,Ab=Math.round,Bb=Object.prototype.hasOwnProperty,Cb=0,Db=1,Eb=2,Fb=3,Gb=4,Hb=5,Ib=6,Jb={},Kb=[],Lb="undefined"!=typeof module&&module&&module.exports,Mb=/^\/?Date\((\-?\d+)/i,Nb=/(\-)?(?:(\d*)\.)?(\d+)\:(\d+)(?:\:(\d+)\.?(\d{3})?)?/,Ob=/^(-)?P(?:(?:([0-9,.]*)Y)?(?:([0-9,.]*)M)?(?:([0-9,.]*)D)?(?:T(?:([0-9,.]*)H)?(?:([0-9,.]*)M)?(?:([0-9,.]*)S)?)?|([0-9,.]*)W)$/,Pb=/(\[[^\[]*\])|(\\)?(Mo|MM?M?M?|Do|DDDo|DD?D?D?|ddd?d?|do?|w[o|w]?|W[o|W]?|Q|YYYYYY|YYYYY|YYYY|YY|gg(ggg?)?|GG(GGG?)?|e|E|a|A|hh?|HH?|mm?|ss?|S{1,4}|x|X|zz?|ZZ?|.)/g,Qb=/(\[[^\[]*\])|(\\)?(LTS|LT|LL?L?L?|l{1,4})/g,Rb=/\d\d?/,Sb=/\d{1,3}/,Tb=/\d{1,4}/,Ub=/[+\-]?\d{1,6}/,Vb=/\d+/,Wb=/[0-9]*['a-z\u00A0-\u05FF\u0700-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+|[\u0600-\u06FF\/]+(\s*?[\u0600-\u06FF]+){1,2}/i,Xb=/Z|[\+\-]\d\d:?\d\d/gi,Yb=/T/i,Zb=/[\+\-]?\d+/,$b=/[\+\-]?\d+(\.\d{1,3})?/,_b=/\d/,ac=/\d\d/,bc=/\d{3}/,cc=/\d{4}/,dc=/[+-]?\d{6}/,ec=/[+-]?\d+/,fc=/^\s*(?:[+-]\d{6}|\d{4})-(?:(\d\d-\d\d)|(W\d\d$)|(W\d\d-\d)|(\d\d\d))((T| )(\d\d(:\d\d(:\d\d(\.\d+)?)?)?)?([\+\-]\d\d(?::?\d\d)?|\s*Z)?)?$/,gc="YYYY-MM-DDTHH:mm:ssZ",hc=[["YYYYYY-MM-DD",/[+-]\d{6}-\d{2}-\d{2}/],["YYYY-MM-DD",/\d{4}-\d{2}-\d{2}/],["GGGG-[W]WW-E",/\d{4}-W\d{2}-\d/],["GGGG-[W]WW",/\d{4}-W\d{2}/],["YYYY-DDD",/\d{4}-\d{3}/]],ic=[["HH:mm:ss.SSSS",/(T| )\d\d:\d\d:\d\d\.\d+/],["HH:mm:ss",/(T| )\d\d:\d\d:\d\d/],["HH:mm",/(T| )\d\d:\d\d/],["HH",/(T| )\d\d/]],jc=/([\+\-]|\d\d)/gi,kc=("Date|Hours|Minutes|Seconds|Milliseconds".split("|"),{Milliseconds:1,Seconds:1e3,Minutes:6e4,Hours:36e5,Days:864e5,Months:2592e6,Years:31536e6}),lc={ms:"millisecond",s:"second",m:"minute",h:"hour",d:"day",D:"date",w:"week",W:"isoWeek",M:"month",Q:"quarter",y:"year",DDD:"dayOfYear",e:"weekday",E:"isoWeekday",gg:"weekYear",GG:"isoWeekYear"},mc={dayofyear:"dayOfYear",isoweekday:"isoWeekday",isoweek:"isoWeek",weekyear:"weekYear",isoweekyear:"isoWeekYear"},nc={},oc={s:45,m:45,h:22,d:26,M:11},pc="DDD w W M D d".split(" "),qc="M D H h m s w W".split(" "),rc={M:function(){return this.month()+1},MMM:function(a){return this.localeData().monthsShort(this,a)},MMMM:function(a){return this.localeData().months(this,a)},D:function(){return this.date()},DDD:function(){return this.dayOfYear()},d:function(){return this.day()},dd:function(a){return this.localeData().weekdaysMin(this,a)},ddd:function(a){return this.localeData().weekdaysShort(this,a)},dddd:function(a){return this.localeData().weekdays(this,a)},w:function(){return this.week()},W:function(){return this.isoWeek()},YY:function(){return r(this.year()%100,2)},YYYY:function(){return r(this.year(),4)},YYYYY:function(){return r(this.year(),5)},YYYYYY:function(){var a=this.year(),b=a>=0?"+":"-";return b+r(Math.abs(a),6)},gg:function(){return r(this.weekYear()%100,2)},gggg:function(){return r(this.weekYear(),4)},ggggg:function(){return r(this.weekYear(),5)},GG:function(){return r(this.isoWeekYear()%100,2)},GGGG:function(){return r(this.isoWeekYear(),4)},GGGGG:function(){return r(this.isoWeekYear(),5)},e:function(){return this.weekday()},E:function(){return this.isoWeekday()},a:function(){return this.localeData().meridiem(this.hours(),this.minutes(),!0)},A:function(){return this.localeData().meridiem(this.hours(),this.minutes(),!1)},H:function(){return this.hours()},h:function(){return this.hours()%12||12},m:function(){return this.minutes()},s:function(){return this.seconds()},S:function(){return C(this.milliseconds()/100)},SS:function(){return r(C(this.milliseconds()/10),2)},SSS:function(){return r(this.milliseconds(),3)},SSSS:function(){return r(this.milliseconds(),3)},Z:function(){var a=this.utcOffset(),b="+";return 0>a&&(a=-a,b="-"),b+r(C(a/60),2)+":"+r(C(a)%60,2)},ZZ:function(){var a=this.utcOffset(),b="+";return 0>a&&(a=-a,b="-"),b+r(C(a/60),2)+r(C(a)%60,2)},z:function(){return this.zoneAbbr()},zz:function(){return this.zoneName()},x:function(){return this.valueOf()},X:function(){return this.unix()},Q:function(){return this.quarter()}},sc={},tc=["months","monthsShort","weekdays","weekdaysShort","weekdaysMin"],uc=!1;pc.length;)xb=pc.pop(),rc[xb+"o"]=i(rc[xb],xb);for(;qc.length;)xb=qc.pop(),rc[xb+xb]=h(rc[xb],2);rc.DDDD=h(rc.DDD,3),o(l.prototype,{set:function(a){var b,c;for(c in a)b=a[c],"function"==typeof b?this[c]=b:this["_"+c]=b;this._ordinalParseLenient=new RegExp(this._ordinalParse.source+"|"+/\d{1,2}/.source)},_months:"January_February_March_April_May_June_July_August_September_October_November_December".split("_"),months:function(a){return this._months[a.month()]},_monthsShort:"Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec".split("_"),monthsShort:function(a){return this._monthsShort[a.month()]},monthsParse:function(a,b,c){var d,e,f;for(this._monthsParse||(this._monthsParse=[],this._longMonthsParse=[],this._shortMonthsParse=[]),d=0;12>d;d++){if(e=vb.utc([2e3,d]),c&&!this._longMonthsParse[d]&&(this._longMonthsParse[d]=new RegExp("^"+this.months(e,"").replace(".","")+"$","i"),this._shortMonthsParse[d]=new RegExp("^"+this.monthsShort(e,"").replace(".","")+"$","i")),c||this._monthsParse[d]||(f="^"+this.months(e,"")+"|^"+this.monthsShort(e,""),this._monthsParse[d]=new RegExp(f.replace(".",""),"i")),c&&"MMMM"===b&&this._longMonthsParse[d].test(a))return d;if(c&&"MMM"===b&&this._shortMonthsParse[d].test(a))return d;if(!c&&this._monthsParse[d].test(a))return d}},_weekdays:"Sunday_Monday_Tuesday_Wednesday_Thursday_Friday_Saturday".split("_"),weekdays:function(a){return this._weekdays[a.day()]},_weekdaysShort:"Sun_Mon_Tue_Wed_Thu_Fri_Sat".split("_"),weekdaysShort:function(a){return this._weekdaysShort[a.day()]},_weekdaysMin:"Su_Mo_Tu_We_Th_Fr_Sa".split("_"),weekdaysMin:function(a){return this._weekdaysMin[a.day()]},weekdaysParse:function(a){var b,c,d;for(this._weekdaysParse||(this._weekdaysParse=[]),b=0;7>b;b++)if(this._weekdaysParse[b]||(c=vb([2e3,1]).day(b),d="^"+this.weekdays(c,"")+"|^"+this.weekdaysShort(c,"")+"|^"+this.weekdaysMin(c,""),this._weekdaysParse[b]=new RegExp(d.replace(".",""),"i")),this._weekdaysParse[b].test(a))return b},_longDateFormat:{LTS:"h:mm:ss A",LT:"h:mm A",L:"MM/DD/YYYY",LL:"MMMM D, YYYY",LLL:"MMMM D, YYYY LT",LLLL:"dddd, MMMM D, YYYY LT"},longDateFormat:function(a){var b=this._longDateFormat[a];return!b&&this._longDateFormat[a.toUpperCase()]&&(b=this._longDateFormat[a.toUpperCase()].replace(/MMMM|MM|DD|dddd/g,function(a){return a.slice(1)}),this._longDateFormat[a]=b),b},isPM:function(a){return"p"===(a+"").toLowerCase().charAt(0)},_meridiemParse:/[ap]\.?m?\.?/i,meridiem:function(a,b,c){return a>11?c?"pm":"PM":c?"am":"AM"},_calendar:{sameDay:"[Today at] LT",nextDay:"[Tomorrow at] LT",nextWeek:"dddd [at] LT",lastDay:"[Yesterday at] LT",lastWeek:"[Last] dddd [at] LT",sameElse:"L"},calendar:function(a,b,c){var d=this._calendar[a];return"function"==typeof d?d.apply(b,[c]):d},_relativeTime:{future:"in %s",past:"%s ago",s:"a few seconds",m:"a minute",mm:"%d minutes",h:"an hour",hh:"%d hours",d:"a day",dd:"%d days",M:"a month",MM:"%d months",y:"a year",yy:"%d years"},relativeTime:function(a,b,c,d){var e=this._relativeTime[c];return"function"==typeof e?e(a,b,c,d):e.replace(/%d/i,a)},pastFuture:function(a,b){var c=this._relativeTime[a>0?"future":"past"];return"function"==typeof c?c(b):c.replace(/%s/i,b)},ordinal:function(a){return this._ordinal.replace("%d",a)},_ordinal:"%d",_ordinalParse:/\d{1,2}/,preparse:function(a){return a},postformat:function(a){return a},week:function(a){return jb(a,this._week.dow,this._week.doy).week},_week:{dow:0,doy:6},firstDayOfWeek:function(){return this._week.dow},firstDayOfYear:function(){return this._week.doy},_invalidDate:"Invalid date",invalidDate:function(){return this._invalidDate}}),vb=function(b,c,e,f){var g;return"boolean"==typeof e&&(f=e,e=a),g={},g._isAMomentObject=!0,g._i=b,g._f=c,g._l=e,g._strict=f,g._isUTC=!1,g._pf=d(),lb(g)},vb.suppressDeprecationWarnings=!1,vb.createFromInputFallback=f("moment construction falls back to js Date. This is discouraged and will be removed in upcoming major release. Please refer to https://github.com/moment/moment/issues/1407 for more info.",function(a){a._d=new Date(a._i+(a._useUTC?" UTC":""))}),vb.min=function(){var a=[].slice.call(arguments,0);return mb("isBefore",a)},vb.max=function(){var a=[].slice.call(arguments,0);return mb("isAfter",a)},vb.utc=function(b,c,e,f){var g;return"boolean"==typeof e&&(f=e,e=a),g={},g._isAMomentObject=!0,g._useUTC=!0,g._isUTC=!0,g._l=e,g._i=b,g._f=c,g._strict=f,g._pf=d(),lb(g).utc()},vb.unix=function(a){return vb(1e3*a)},vb.duration=function(a,b){var d,e,f,g,h=a,i=null;return vb.isDuration(a)?h={ms:a._milliseconds,d:a._days,M:a._months}:"number"==typeof a?(h={},b?h[b]=a:h.milliseconds=a):(i=Nb.exec(a))?(d="-"===i[1]?-1:1,h={y:0,d:C(i[Eb])*d,h:C(i[Fb])*d,m:C(i[Gb])*d,s:C(i[Hb])*d,ms:C(i[Ib])*d}):(i=Ob.exec(a))?(d="-"===i[1]?-1:1,f=function(a){var b=a&&parseFloat(a.replace(",","."));return(isNaN(b)?0:b)*d},h={y:f(i[2]),M:f(i[3]),d:f(i[4]),h:f(i[5]),m:f(i[6]),s:f(i[7]),w:f(i[8])}):null==h?h={}:"object"==typeof h&&("from"in h||"to"in h)&&(g=t(vb(h.from),vb(h.to)),h={},h.ms=g.milliseconds,h.M=g.months),e=new n(h),vb.isDuration(a)&&c(a,"_locale")&&(e._locale=a._locale),e},vb.version=yb,vb.defaultFormat=gc,vb.ISO_8601=function(){},vb.momentProperties=Kb,vb.updateOffset=function(){},vb.relativeTimeThreshold=function(b,c){return oc[b]===a?!1:c===a?oc[b]:(oc[b]=c,!0)},vb.lang=f("moment.lang is deprecated. Use moment.locale instead.",function(a,b){return vb.locale(a,b)}),vb.locale=function(a,b){var c;return a&&(c="undefined"!=typeof b?vb.defineLocale(a,b):vb.localeData(a),c&&(vb.duration._locale=vb._locale=c)),vb._locale._abbr},vb.defineLocale=function(a,b){return null!==b?(b.abbr=a,Jb[a]||(Jb[a]=new l),Jb[a].set(b),vb.locale(a),Jb[a]):(delete Jb[a],null)},vb.langData=f("moment.langData is deprecated. Use moment.localeData instead.",function(a){return vb.localeData(a)}),vb.localeData=function(a){var b;if(a&&a._locale&&a._locale._abbr&&(a=a._locale._abbr),!a)return vb._locale;if(!w(a)){if(b=L(a))return b;a=[a]}return K(a)},vb.isMoment=function(a){return a instanceof m||null!=a&&c(a,"_isAMomentObject")},vb.isDuration=function(a){return a instanceof n};for(xb=tc.length-1;xb>=0;--xb)B(tc[xb]);vb.normalizeUnits=function(a){return z(a)},vb.invalid=function(a){var b=vb.utc(0/0);return null!=a?o(b._pf,a):b._pf.userInvalidated=!0,b},vb.parseZone=function(){return vb.apply(null,arguments).parseZone()},vb.parseTwoDigitYear=function(a){return C(a)+(C(a)>68?1900:2e3)},vb.isDate=x,o(vb.fn=m.prototype,{clone:function(){return vb(this)},valueOf:function(){return+this._d-6e4*(this._offset||0)},unix:function(){return Math.floor(+this/1e3)},toString:function(){return this.clone().locale("en").format("ddd MMM DD YYYY HH:mm:ss [GMT]ZZ")},toDate:function(){return this._offset?new Date(+this):this._d},toISOString:function(){var a=vb(this).utc();return 0<a.year()&&a.year()<=9999?"function"==typeof Date.prototype.toISOString?this.toDate().toISOString():P(a,"YYYY-MM-DD[T]HH:mm:ss.SSS[Z]"):P(a,"YYYYYY-MM-DD[T]HH:mm:ss.SSS[Z]")},toArray:function(){var a=this;return[a.year(),a.month(),a.date(),a.hours(),a.minutes(),a.seconds(),a.milliseconds()]},isValid:function(){return I(this)},isDSTShifted:function(){return this._a?this.isValid()&&y(this._a,(this._isUTC?vb.utc(this._a):vb(this._a)).toArray())>0:!1},parsingFlags:function(){return o({},this._pf)},invalidAt:function(){return this._pf.overflow},utc:function(a){return this.utcOffset(0,a)},local:function(a){return this._isUTC&&(this.utcOffset(0,a),this._isUTC=!1,a&&this.subtract(this._dateUtcOffset(),"m")),this},format:function(a){var b=P(this,a||vb.defaultFormat);return this.localeData().postformat(b)},add:u(1,"add"),subtract:u(-1,"subtract"),diff:function(a,b,c){var d,e,f=M(a,this),g=6e4*(f.utcOffset()-this.utcOffset());return b=z(b),"year"===b||"month"===b||"quarter"===b?(e=j(this,f),"quarter"===b?e/=3:"year"===b&&(e/=12)):(d=this-f,e="second"===b?d/1e3:"minute"===b?d/6e4:"hour"===b?d/36e5:"day"===b?(d-g)/864e5:"week"===b?(d-g)/6048e5:d),c?e:q(e)},from:function(a,b){return vb.duration({to:this,from:a}).locale(this.locale()).humanize(!b)},fromNow:function(a){return this.from(vb(),a)},calendar:function(a){var b=a||vb(),c=M(b,this).startOf("day"),d=this.diff(c,"days",!0),e=-6>d?"sameElse":-1>d?"lastWeek":0>d?"lastDay":1>d?"sameDay":2>d?"nextDay":7>d?"nextWeek":"sameElse";return this.format(this.localeData().calendar(e,this,vb(b)))},isLeapYear:function(){return G(this.year())},isDST:function(){return this.utcOffset()>this.clone().month(0).utcOffset()||this.utcOffset()>this.clone().month(5).utcOffset()},day:function(a){var b=this._isUTC?this._d.getUTCDay():this._d.getDay();return null!=a?(a=gb(a,this.localeData()),this.add(a-b,"d")):b},month:qb("Month",!0),startOf:function(a){switch(a=z(a)){case"year":this.month(0);case"quarter":case"month":this.date(1);case"week":case"isoWeek":case"day":this.hours(0);case"hour":this.minutes(0);case"minute":this.seconds(0);case"second":this.milliseconds(0)}return"week"===a?this.weekday(0):"isoWeek"===a&&this.isoWeekday(1),"quarter"===a&&this.month(3*Math.floor(this.month()/3)),this},endOf:function(b){return b=z(b),b===a||"millisecond"===b?this:this.startOf(b).add(1,"isoWeek"===b?"week":b).subtract(1,"ms")},isAfter:function(a,b){var c;return b=z("undefined"!=typeof b?b:"millisecond"),"millisecond"===b?(a=vb.isMoment(a)?a:vb(a),+this>+a):(c=vb.isMoment(a)?+a:+vb(a),c<+this.clone().startOf(b))},isBefore:function(a,b){var c;return b=z("undefined"!=typeof b?b:"millisecond"),"millisecond"===b?(a=vb.isMoment(a)?a:vb(a),+a>+this):(c=vb.isMoment(a)?+a:+vb(a),+this.clone().endOf(b)<c)},isBetween:function(a,b,c){return this.isAfter(a,c)&&this.isBefore(b,c)},isSame:function(a,b){var c;return b=z(b||"millisecond"),"millisecond"===b?(a=vb.isMoment(a)?a:vb(a),+this===+a):(c=+vb(a),+this.clone().startOf(b)<=c&&c<=+this.clone().endOf(b))},min:f("moment().min is deprecated, use moment.min instead. https://github.com/moment/moment/issues/1548",function(a){return a=vb.apply(null,arguments),this>a?this:a}),max:f("moment().max is deprecated, use moment.max instead. https://github.com/moment/moment/issues/1548",function(a){return a=vb.apply(null,arguments),a>this?this:a}),zone:f("moment().zone is deprecated, use moment().utcOffset instead. https://github.com/moment/moment/issues/1779",function(a,b){return null!=a?("string"!=typeof a&&(a=-a),this.utcOffset(a,b),this):-this.utcOffset()}),utcOffset:function(a,b){var c,d=this._offset||0;return null!=a?("string"==typeof a&&(a=S(a)),Math.abs(a)<16&&(a=60*a),!this._isUTC&&b&&(c=this._dateUtcOffset()),this._offset=a,this._isUTC=!0,null!=c&&this.add(c,"m"),d!==a&&(!b||this._changeInProgress?v(this,vb.duration(a-d,"m"),1,!1):this._changeInProgress||(this._changeInProgress=!0,vb.updateOffset(this,!0),this._changeInProgress=null)),this):this._isUTC?d:this._dateUtcOffset()},isLocal:function(){return!this._isUTC},isUtcOffset:function(){return this._isUTC},isUtc:function(){return this._isUTC&&0===this._offset},zoneAbbr:function(){return this._isUTC?"UTC":""},zoneName:function(){return this._isUTC?"Coordinated Universal Time":""},parseZone:function(){return this._tzm?this.utcOffset(this._tzm):"string"==typeof this._i&&this.utcOffset(S(this._i)),this},hasAlignedHourOffset:function(a){return a=a?vb(a).utcOffset():0,(this.utcOffset()-a)%60===0},daysInMonth:function(){return D(this.year(),this.month())},dayOfYear:function(a){var b=Ab((vb(this).startOf("day")-vb(this).startOf("year"))/864e5)+1;return null==a?b:this.add(a-b,"d")},quarter:function(a){return null==a?Math.ceil((this.month()+1)/3):this.month(3*(a-1)+this.month()%3)},weekYear:function(a){var b=jb(this,this.localeData()._week.dow,this.localeData()._week.doy).year;return null==a?b:this.add(a-b,"y")},isoWeekYear:function(a){var b=jb(this,1,4).year;return null==a?b:this.add(a-b,"y")},week:function(a){var b=this.localeData().week(this);return null==a?b:this.add(7*(a-b),"d")},isoWeek:function(a){var b=jb(this,1,4).week;return null==a?b:this.add(7*(a-b),"d")},weekday:function(a){var b=(this.day()+7-this.localeData()._week.dow)%7;return null==a?b:this.add(a-b,"d")},isoWeekday:function(a){return null==a?this.day()||7:this.day(this.day()%7?a:a-7)},isoWeeksInYear:function(){return E(this.year(),1,4)},weeksInYear:function(){var a=this.localeData()._week;return E(this.year(),a.dow,a.doy)},get:function(a){return a=z(a),this[a]()},set:function(a,b){var c;if("object"==typeof a)for(c in a)this.set(c,a[c]);else a=z(a),"function"==typeof this[a]&&this[a](b);return this},locale:function(b){var c;return b===a?this._locale._abbr:(c=vb.localeData(b),null!=c&&(this._locale=c),this)},lang:f("moment().lang() is deprecated. Instead, use moment().localeData() to get the language configuration. Use moment().locale() to change languages.",function(b){return b===a?this.localeData():this.locale(b)}),localeData:function(){return this._locale},_dateUtcOffset:function(){return 15*-Math.round(this._d.getTimezoneOffset()/15)}}),vb.fn.millisecond=vb.fn.milliseconds=qb("Milliseconds",!1),vb.fn.second=vb.fn.seconds=qb("Seconds",!1),vb.fn.minute=vb.fn.minutes=qb("Minutes",!1),vb.fn.hour=vb.fn.hours=qb("Hours",!0),vb.fn.date=qb("Date",!0),vb.fn.dates=f("dates accessor is deprecated. Use date instead.",qb("Date",!0)),vb.fn.year=qb("FullYear",!0),vb.fn.years=f("years accessor is deprecated. Use year instead.",qb("FullYear",!0)),vb.fn.days=vb.fn.day,vb.fn.months=vb.fn.month,vb.fn.weeks=vb.fn.week,vb.fn.isoWeeks=vb.fn.isoWeek,vb.fn.quarters=vb.fn.quarter,vb.fn.toJSON=vb.fn.toISOString,vb.fn.isUTC=vb.fn.isUtc,o(vb.duration.fn=n.prototype,{_bubble:function(){var a,b,c,d=this._milliseconds,e=this._days,f=this._months,g=this._data,h=0;g.milliseconds=d%1e3,a=q(d/1e3),g.seconds=a%60,b=q(a/60),g.minutes=b%60,c=q(b/60),g.hours=c%24,e+=q(c/24),h=q(rb(e)),e-=q(sb(h)),f+=q(e/30),e%=30,h+=q(f/12),f%=12,g.days=e,g.months=f,g.years=h},abs:function(){return this._milliseconds=Math.abs(this._milliseconds),this._days=Math.abs(this._days),this._months=Math.abs(this._months),this._data.milliseconds=Math.abs(this._data.milliseconds),this._data.seconds=Math.abs(this._data.seconds),this._data.minutes=Math.abs(this._data.minutes),this._data.hours=Math.abs(this._data.hours),this._data.months=Math.abs(this._data.months),this._data.years=Math.abs(this._data.years),this},weeks:function(){return q(this.days()/7)},valueOf:function(){return this._milliseconds+864e5*this._days+this._months%12*2592e6+31536e6*C(this._months/12)
},humanize:function(a){var b=ib(this,!a,this.localeData());return a&&(b=this.localeData().pastFuture(+this,b)),this.localeData().postformat(b)},add:function(a,b){var c=vb.duration(a,b);return this._milliseconds+=c._milliseconds,this._days+=c._days,this._months+=c._months,this._bubble(),this},subtract:function(a,b){var c=vb.duration(a,b);return this._milliseconds-=c._milliseconds,this._days-=c._days,this._months-=c._months,this._bubble(),this},get:function(a){return a=z(a),this[a.toLowerCase()+"s"]()},as:function(a){var b,c;if(a=z(a),"month"===a||"year"===a)return b=this._days+this._milliseconds/864e5,c=this._months+12*rb(b),"month"===a?c:c/12;switch(b=this._days+Math.round(sb(this._months/12)),a){case"week":return b/7+this._milliseconds/6048e5;case"day":return b+this._milliseconds/864e5;case"hour":return 24*b+this._milliseconds/36e5;case"minute":return 24*b*60+this._milliseconds/6e4;case"second":return 24*b*60*60+this._milliseconds/1e3;case"millisecond":return Math.floor(24*b*60*60*1e3)+this._milliseconds;default:throw new Error("Unknown unit "+a)}},lang:vb.fn.lang,locale:vb.fn.locale,toIsoString:f("toIsoString() is deprecated. Please use toISOString() instead (notice the capitals)",function(){return this.toISOString()}),toISOString:function(){var a=Math.abs(this.years()),b=Math.abs(this.months()),c=Math.abs(this.days()),d=Math.abs(this.hours()),e=Math.abs(this.minutes()),f=Math.abs(this.seconds()+this.milliseconds()/1e3);return this.asSeconds()?(this.asSeconds()<0?"-":"")+"P"+(a?a+"Y":"")+(b?b+"M":"")+(c?c+"D":"")+(d||e||f?"T":"")+(d?d+"H":"")+(e?e+"M":"")+(f?f+"S":""):"P0D"},localeData:function(){return this._locale},toJSON:function(){return this.toISOString()}}),vb.duration.fn.toString=vb.duration.fn.toISOString;for(xb in kc)c(kc,xb)&&tb(xb.toLowerCase());vb.duration.fn.asMilliseconds=function(){return this.as("ms")},vb.duration.fn.asSeconds=function(){return this.as("s")},vb.duration.fn.asMinutes=function(){return this.as("m")},vb.duration.fn.asHours=function(){return this.as("h")},vb.duration.fn.asDays=function(){return this.as("d")},vb.duration.fn.asWeeks=function(){return this.as("weeks")},vb.duration.fn.asMonths=function(){return this.as("M")},vb.duration.fn.asYears=function(){return this.as("y")},vb.locale("en",{ordinalParse:/\d{1,2}(th|st|nd|rd)/,ordinal:function(a){var b=a%10,c=1===C(a%100/10)?"th":1===b?"st":2===b?"nd":3===b?"rd":"th";return a+c}}),Lb?module.exports=vb:"function"==typeof define&&define.amd?(define(function(a,b,c){return c.config&&c.config()&&c.config().noGlobal===!0&&(zb.moment=wb),vb}),ub(!0)):ub()}).call(this);
(function(root,factory){if(typeof define==='function'&&define.amd){define(['moment','jquery','exports'],function(momentjs,$,exports){root.daterangepicker=factory(root,exports,momentjs,$);});}else if(typeof exports!=='undefined'){var momentjs=require('moment');var jQuery;try{jQuery=require('jquery');}catch(err){jQuery=window.jQuery;if(!jQuery)throw new Error('jQuery dependency not found');}
factory(root,exports,momentjs,jQuery);}else{root.daterangepicker=factory(root,{},root.moment||moment,(root.jQuery||root.Zepto||root.ender||root.$));}}(this,function(root,daterangepicker,moment,$){var DateRangePicker=function(element,options,cb){this.parentEl='body';this.element=$(element);this.isShowing=false;var DRPTemplate='<div class="daterangepicker dropdown-menu">'+'<div class="calendar first left"></div>'+'<div class="calendar second right"></div>'+'<div class="ranges">'+'<div class="range_inputs">'+'<div class="daterangepicker_start_input">'+'<label for="daterangepicker_start"></label>'+'<input class="input-mini" type="text" name="daterangepicker_start" value="" />'+'</div>'+'<div class="daterangepicker_end_input">'+'<label for="daterangepicker_end"></label>'+'<input class="input-mini" type="text" name="daterangepicker_end" value="" />'+'</div>'+'<button class="applyBtn" disabled="disabled" type="button"></button>&nbsp;'+'<button class="cancelBtn" type="button"></button>'+'</div>'+'</div>'+'</div>';if(typeof options!=='object'||options===null)
options={};this.parentEl=(typeof options==='object'&&options.parentEl&&$(options.parentEl).length)?$(options.parentEl):$(this.parentEl);this.container=$(DRPTemplate).appendTo(this.parentEl);options=$.extend(this.element.data(),options);this.setOptions(options,cb);this.container.find('.calendar').on('click.daterangepicker','.prev',$.proxy(this.clickPrev,this)).on('click.daterangepicker','.next',$.proxy(this.clickNext,this)).on('click.daterangepicker','td.available',$.proxy(this.clickDate,this)).on('mouseenter.daterangepicker','td.available',$.proxy(this.hoverDate,this)).on('mouseleave.daterangepicker','td.available',$.proxy(this.updateFormInputs,this)).on('change.daterangepicker','select.yearselect',$.proxy(this.updateMonthYear,this)).on('change.daterangepicker','select.monthselect',$.proxy(this.updateMonthYear,this)).on('change.daterangepicker','select.hourselect,select.minuteselect,select.secondselect,select.ampmselect',$.proxy(this.updateTime,this));this.container.find('.ranges').on('click.daterangepicker','button.applyBtn',$.proxy(this.clickApply,this)).on('click.daterangepicker','button.cancelBtn',$.proxy(this.clickCancel,this)).on('click.daterangepicker','.daterangepicker_start_input,.daterangepicker_end_input',$.proxy(this.showCalendars,this)).on('change.daterangepicker','.daterangepicker_start_input,.daterangepicker_end_input',$.proxy(this.inputsChanged,this)).on('keydown.daterangepicker','.daterangepicker_start_input,.daterangepicker_end_input',$.proxy(this.inputsKeydown,this)).on('click.daterangepicker','li',$.proxy(this.clickRange,this)).on('mouseenter.daterangepicker','li',$.proxy(this.enterRange,this)).on('mouseleave.daterangepicker','li',$.proxy(this.updateFormInputs,this));if(this.element.is('input')){this.element.on({'click.daterangepicker':$.proxy(this.show,this),'focus.daterangepicker':$.proxy(this.show,this),'keyup.daterangepicker':$.proxy(this.updateFromControl,this),'keydown.daterangepicker':$.proxy(this.keydown,this)});}else{this.element.on('click.daterangepicker',$.proxy(this.toggle,this));}};DateRangePicker.prototype={constructor:DateRangePicker,setOptions:function(options,callback){this.startDate=moment().startOf('day');this.endDate=moment().endOf('day');this.timeZone=moment().utcOffset();this.minDate=false;this.maxDate=false;this.dateLimit=false;this.showDropdowns=false;this.showWeekNumbers=false;this.timePicker=false;this.timePickerSeconds=false;this.timePickerIncrement=30;this.timePicker12Hour=true;this.autoApply=false;this.singleDatePicker=false;this.ranges={};this.opens='right';if(this.element.hasClass('pull-right'))
this.opens='left';this.drops='down';if(this.element.hasClass('dropup'))
this.drops='up';this.buttonClasses=['btn','btn-small btn-sm'];this.applyClass='btn-warning';this.cancelClass='btn-default';this.format='MM/DD/YYYY';this.separator=' - ';this.locale={applyLabel:'Apply',cancelLabel:'Cancel',fromLabel:'From',toLabel:'To',weekLabel:'W',customRangeLabel:'Custom Range',daysOfWeek:moment.weekdaysMin(),monthNames:moment.monthsShort(),firstDay:moment.localeData()._week.dow};this.cb=function(){};if(typeof options.format==='string')
this.format=options.format;if(typeof options.separator==='string')
this.separator=options.separator;if(typeof options.startDate==='string')
this.startDate=moment(options.startDate,this.format);if(typeof options.endDate==='string')
this.endDate=moment(options.endDate,this.format);if(typeof options.minDate==='string')
this.minDate=moment(options.minDate,this.format);if(typeof options.maxDate==='string')
this.maxDate=moment(options.maxDate,this.format);if(typeof options.startDate==='object')
this.startDate=moment(options.startDate);if(typeof options.endDate==='object')
this.endDate=moment(options.endDate);if(typeof options.minDate==='object')
this.minDate=moment(options.minDate);if(typeof options.maxDate==='object')
this.maxDate=moment(options.maxDate);if(typeof options.applyClass==='string')
this.applyClass=options.applyClass;if(typeof options.cancelClass==='string')
this.cancelClass=options.cancelClass;if(typeof options.dateLimit==='object')
this.dateLimit=options.dateLimit;if(typeof options.locale==='object'){if(typeof options.locale.daysOfWeek==='object'){this.locale.daysOfWeek=options.locale.daysOfWeek.slice();}
if(typeof options.locale.monthNames==='object'){this.locale.monthNames=options.locale.monthNames.slice();}
if(typeof options.locale.firstDay==='number'){this.locale.firstDay=options.locale.firstDay;}
if(typeof options.locale.applyLabel==='string'){this.locale.applyLabel=options.locale.applyLabel;}
if(typeof options.locale.cancelLabel==='string'){this.locale.cancelLabel=options.locale.cancelLabel;}
if(typeof options.locale.fromLabel==='string'){this.locale.fromLabel=options.locale.fromLabel;}
if(typeof options.locale.toLabel==='string'){this.locale.toLabel=options.locale.toLabel;}
if(typeof options.locale.weekLabel==='string'){this.locale.weekLabel=options.locale.weekLabel;}
if(typeof options.locale.customRangeLabel==='string'){this.locale.customRangeLabel=options.locale.customRangeLabel;}}
if(typeof options.opens==='string')
this.opens=options.opens;if(typeof options.drops==='string')
this.drops=options.drops;if(typeof options.showWeekNumbers==='boolean'){this.showWeekNumbers=options.showWeekNumbers;}
if(typeof options.buttonClasses==='string'){this.buttonClasses=[options.buttonClasses];}
if(typeof options.buttonClasses==='object'){this.buttonClasses=options.buttonClasses;}
if(typeof options.showDropdowns==='boolean'){this.showDropdowns=options.showDropdowns;}
if(typeof options.singleDatePicker==='boolean'){this.singleDatePicker=options.singleDatePicker;if(this.singleDatePicker){this.endDate=this.startDate.clone();}}
if(typeof options.timePicker==='boolean'){this.timePicker=options.timePicker;}
if(typeof options.timePickerSeconds==='boolean'){this.timePickerSeconds=options.timePickerSeconds;}
if(typeof options.timePickerIncrement==='number'){this.timePickerIncrement=options.timePickerIncrement;}
if(typeof options.timePicker12Hour==='boolean'){this.timePicker12Hour=options.timePicker12Hour;}
if(typeof options.autoApply==='boolean'){this.autoApply=options.autoApply;if(this.autoApply)
this.container.find('.applyBtn, .cancelBtn').addClass('hide');}
if(this.locale.firstDay!=0){var iterator=this.locale.firstDay;while(iterator>0){this.locale.daysOfWeek.push(this.locale.daysOfWeek.shift());iterator--;}}
var start,end,range;if(typeof options.startDate==='undefined'&&typeof options.endDate==='undefined'){if($(this.element).is('input[type=text]')){var val=$(this.element).val(),split=val.split(this.separator);start=end=null;if(split.length==2){start=moment(split[0],this.format);end=moment(split[1],this.format);}else if(this.singleDatePicker&&val!==""){start=moment(val,this.format);end=moment(val,this.format);}
if(start!==null&&end!==null){this.startDate=start;this.endDate=end;}}}
if(typeof options.timeZone==='string'||typeof options.timeZone==='number'){if(typeof options.timeZone==='string'&&typeof moment.tz!=='undefined'){this.timeZone=moment.tz.zone(options.timeZone).parse(new Date)*-1;}else{this.timeZone=options.timeZone;}
this.startDate.utcOffset(this.timeZone);this.endDate.utcOffset(this.timeZone);}else{this.timeZone=moment(this.startDate).utcOffset();}
if(typeof options.ranges==='object'){for(range in options.ranges){if(typeof options.ranges[range][0]==='string')
start=moment(options.ranges[range][0],this.format);else
start=moment(options.ranges[range][0]);if(typeof options.ranges[range][1]==='string')
end=moment(options.ranges[range][1],this.format);else
end=moment(options.ranges[range][1]);if(this.minDate&&start.isBefore(this.minDate))
start=moment(this.minDate);if(this.maxDate&&end.isAfter(this.maxDate))
end=moment(this.maxDate);if((this.minDate&&end.isBefore(this.minDate))||(this.maxDate&&start.isAfter(this.maxDate))){continue;}
this.ranges[range]=[start,end];}
var list='<ul>';for(range in this.ranges){list+='<li>'+ range+'</li>';}
list+='<li>'+ this.locale.customRangeLabel+'</li>';list+='</ul>';this.container.find('.ranges ul').remove();this.container.find('.ranges').prepend(list);}
if(typeof callback==='function'){this.cb=callback;}
if(!this.timePicker){this.startDate=this.startDate.startOf('day');this.endDate=this.endDate.endOf('day');}
if(this.singleDatePicker){this.opens=this.opens||'right';this.container.addClass('single');this.container.find('.calendar.right').show();this.container.find('.calendar.left').hide();if(!this.timePicker){this.container.find('.ranges').hide();}else{this.container.find('.ranges .daterangepicker_start_input, .ranges .daterangepicker_end_input').hide();}
if(!this.container.find('.calendar.right').hasClass('single'))
this.container.find('.calendar.right').addClass('single');}else{this.container.removeClass('single');this.container.find('.calendar.right').removeClass('single');this.container.find('.ranges').show();}
this.oldStartDate=this.startDate.clone();this.oldEndDate=this.endDate.clone();this.oldChosenLabel=this.chosenLabel;this.leftCalendar={month:moment([this.startDate.year(),this.startDate.month(),1,this.startDate.hour(),this.startDate.minute(),this.startDate.second()]),calendar:[]};this.rightCalendar={month:moment([this.endDate.year(),this.endDate.month(),1,this.endDate.hour(),this.endDate.minute(),this.endDate.second()]),calendar:[]};if(this.opens=='right'||this.opens=='center'){var first=this.container.find('.calendar.first');var second=this.container.find('.calendar.second');if(second.hasClass('single')){second.removeClass('single');first.addClass('single');}
first.removeClass('left').addClass('right');second.removeClass('right').addClass('left');if(this.singleDatePicker){first.show();second.hide();}}
if(typeof options.ranges==='undefined'&&!this.singleDatePicker){this.container.addClass('show-calendar');}
this.container.removeClass('opensleft opensright').addClass('opens'+ this.opens);this.updateView();this.updateCalendars();var c=this.container;$.each(this.buttonClasses,function(idx,val){c.find('button').addClass(val);});this.container.find('.daterangepicker_start_input label').html(this.locale.fromLabel);this.container.find('.daterangepicker_end_input label').html(this.locale.toLabel);if(this.applyClass.length)
this.container.find('.applyBtn').addClass(this.applyClass);if(this.cancelClass.length)
this.container.find('.cancelBtn').addClass(this.cancelClass);this.container.find('.applyBtn').html(this.locale.applyLabel);this.container.find('.cancelBtn').html(this.locale.cancelLabel);},setStartDate:function(startDate){if(typeof startDate==='string')
this.startDate=moment(startDate,this.format).utcOffset(this.timeZone);if(typeof startDate==='object')
this.startDate=moment(startDate);if(!this.timePicker)
this.startDate=this.startDate.startOf('day');this.oldStartDate=this.startDate.clone();this.updateView();this.updateCalendars();this.updateInputText();},setEndDate:function(endDate){if(typeof endDate==='string')
this.endDate=moment(endDate,this.format).utcOffset(this.timeZone);if(typeof endDate==='object')
this.endDate=moment(endDate);if(!this.timePicker)
this.endDate=this.endDate.endOf('day');this.oldEndDate=this.endDate.clone();this.updateView();this.updateCalendars();this.updateInputText();},updateView:function(){this.leftCalendar.month.month(this.startDate.month()).year(this.startDate.year()).hour(this.startDate.hour()).minute(this.startDate.minute());this.rightCalendar.month.month(this.endDate.month()).year(this.endDate.year()).hour(this.endDate.hour()).minute(this.endDate.minute());this.updateFormInputs();},updateFormInputs:function(){this.container.find('input[name=daterangepicker_start]').val(this.startDate.format(this.format));this.container.find('input[name=daterangepicker_end]').val(this.endDate.format(this.format));if(this.startDate.isSame(this.endDate)||this.startDate.isBefore(this.endDate)){this.container.find('button.applyBtn').removeAttr('disabled');}else{this.container.find('button.applyBtn').attr('disabled','disabled');}},updateFromControl:function(){if(!this.element.is('input'))return;if(!this.element.val().length)return;var dateString=this.element.val().split(this.separator),start=null,end=null;if(dateString.length===2){start=moment(dateString[0],this.format).utcOffset(this.timeZone);end=moment(dateString[1],this.format).utcOffset(this.timeZone);}
if(this.singleDatePicker||start===null||end===null){start=moment(this.element.val(),this.format).utcOffset(this.timeZone);end=start;}
if(end.isBefore(start))return;this.oldStartDate=this.startDate.clone();this.oldEndDate=this.endDate.clone();this.startDate=start;this.endDate=end;if(!this.startDate.isSame(this.oldStartDate)||!this.endDate.isSame(this.oldEndDate))
this.notify();this.updateCalendars();},keydown:function(e){if((e.keyCode===9)||(e.keyCode===13)){this.hide();}},notify:function(){this.updateView();this.updateInputText();this.cb(this.startDate,this.endDate,this.chosenLabel);},move:function(){var parentOffset={top:0,left:0},containerTop;var parentRightEdge=$(window).width();if(!this.parentEl.is('body')){parentOffset={top:this.parentEl.offset().top- this.parentEl.scrollTop(),left:this.parentEl.offset().left- this.parentEl.scrollLeft()};parentRightEdge=this.parentEl[0].clientWidth+ this.parentEl.offset().left;}
if(this.drops=='up')
containerTop=this.element.offset().top- this.container.outerHeight()- parentOffset.top;else
containerTop=this.element.offset().top+ this.element.outerHeight()- parentOffset.top;this.container[this.drops=='up'?'addClass':'removeClass']('dropup');if(this.opens=='left'){this.container.css({top:containerTop,right:parentRightEdge- this.element.offset().left- this.element.outerWidth(),left:'auto'});if(this.container.offset().left<0){this.container.css({right:'auto',left:9});}}else if(this.opens=='center'){this.container.css({top:containerTop,left:this.element.offset().left- parentOffset.left+ this.element.outerWidth()/ 2
- this.container.outerWidth()/ 2,
right:'auto'});if(this.container.offset().left<0){this.container.css({right:'auto',left:9});}}else{this.container.css({top:containerTop,left:this.element.offset().left- parentOffset.left,right:'auto'});if(this.container.offset().left+ this.container.outerWidth()>$(window).width()){this.container.css({left:'auto',right:0});}}},toggle:function(e){if(this.element.hasClass('active')){this.hide();}else{this.show();}},show:function(e){if(this.isShowing)return;this.element.addClass('active');this.container.show();this.move();this._outsideClickProxy=$.proxy(function(e){this.outsideClick(e);},this);$(document).on('mousedown.daterangepicker',this._outsideClickProxy).on('touchend.daterangepicker',this._outsideClickProxy).on('click.daterangepicker','[data-toggle=dropdown]',this._outsideClickProxy).on('focusin.daterangepicker',this._outsideClickProxy);this.isShowing=true;this.element.trigger('show.daterangepicker',this);},outsideClick:function(e){var target=$(e.target);if(e.type=="focusin"||target.closest(this.element).length||target.closest(this.container).length||target.closest('.calendar-date').length)return;this.hide();},hide:function(e){if(!this.isShowing)return;$(document).off('.daterangepicker');this.element.removeClass('active');this.container.hide();if(!this.startDate.isSame(this.oldStartDate)||!this.endDate.isSame(this.oldEndDate))
this.notify();this.oldStartDate=this.startDate.clone();this.oldEndDate=this.endDate.clone();this.isShowing=false;this.element.trigger('hide.daterangepicker',this);},enterRange:function(e){var label=e.target.innerHTML;if(label==this.locale.customRangeLabel){this.updateView();}else{var dates=this.ranges[label];this.container.find('input[name=daterangepicker_start]').val(dates[0].format(this.format));this.container.find('input[name=daterangepicker_end]').val(dates[1].format(this.format));}},showCalendars:function(){this.container.addClass('show-calendar');this.move();this.element.trigger('showCalendar.daterangepicker',this);},hideCalendars:function(){this.container.removeClass('show-calendar');this.element.trigger('hideCalendar.daterangepicker',this);},inputsChanged:function(e){var el=$(e.target);var date=moment(el.val(),this.format);if(!date.isValid())return;var startDate,endDate;if(el.attr('name')==='daterangepicker_start'){startDate=(false!==this.minDate&&date.isBefore(this.minDate))?this.minDate:date;endDate=this.endDate;if(typeof this.dateLimit==='object'){var maxDate=moment(startDate).add(this.dateLimit).endOf('day');if(endDate.isAfter(maxDate)){endDate=maxDate;}}}else{startDate=this.startDate;endDate=(false!==this.maxDate&&date.isAfter(this.maxDate))?this.maxDate:date.endOf('day');if(typeof this.dateLimit==='object'){var minDate=moment(endDate).subtract(this.dateLimit).startOf('day');if(startDate.isBefore(minDate)){startDate=minDate;}}}
this.setCustomDates(startDate,endDate);},inputsKeydown:function(e){if(e.keyCode===13){this.inputsChanged(e);this.notify();}},updateInputText:function(){if(this.element.is('input')&&!this.singleDatePicker){this.element.val(this.startDate.format(this.format)+ this.separator+ this.endDate.format(this.format));this.element.trigger('change');}else if(this.element.is('input')){this.element.val(this.endDate.format(this.format));this.element.trigger('change');}},clickRange:function(e){var label=e.target.innerHTML;this.chosenLabel=label;if(label==this.locale.customRangeLabel){this.showCalendars();}else{var dates=this.ranges[label];this.startDate=dates[0];this.endDate=dates[1];if(!this.timePicker){this.startDate.startOf('day');this.endDate.endOf('day');}
this.leftCalendar.month.month(this.startDate.month()).year(this.startDate.year()).hour(this.startDate.hour()).minute(this.startDate.minute());this.rightCalendar.month.month(this.endDate.month()).year(this.endDate.year()).hour(this.endDate.hour()).minute(this.endDate.minute());this.updateCalendars();this.updateInputText();this.hideCalendars();this.hide();this.element.trigger('apply.daterangepicker',this);if(this.autoApply){this.notify();}}},clickPrev:function(e){var cal=$(e.target).parents('.calendar');if(cal.hasClass('left')){this.leftCalendar.month.subtract(1,'month');}else{this.rightCalendar.month.subtract(1,'month');}
this.updateCalendars();},clickNext:function(e){var cal=$(e.target).parents('.calendar');if(cal.hasClass('left')){this.leftCalendar.month.add(1,'month');}else{this.rightCalendar.month.add(1,'month');}
this.updateCalendars();},hoverDate:function(e){var title=$(e.target).attr('data-title');var row=title.substr(1,1);var col=title.substr(3,1);var cal=$(e.target).parents('.calendar');if(cal.hasClass('left')){this.container.find('input[name=daterangepicker_start]').val(this.leftCalendar.calendar[row][col].format(this.format));}else{this.container.find('input[name=daterangepicker_end]').val(this.rightCalendar.calendar[row][col].format(this.format));}},setCustomDates:function(startDate,endDate){this.chosenLabel=this.locale.customRangeLabel;if(startDate.isAfter(endDate)){var difference=this.endDate.diff(this.startDate);endDate=moment(startDate).add(difference,'ms');if(this.maxDate&&endDate.isAfter(this.maxDate)){endDate=this.maxDate.clone();}}
this.startDate=startDate;this.endDate=endDate;this.updateView();this.updateCalendars();if(this.autoApply){this.notify();this.element.trigger('apply.daterangepicker',this);}},clickDate:function(e){var title=$(e.target).attr('data-title');var row=title.substr(1,1);var col=title.substr(3,1);var cal=$(e.target).parents('.calendar');var startDate,endDate;if(cal.hasClass('left')){startDate=this.leftCalendar.calendar[row][col];endDate=this.endDate;if(typeof this.dateLimit==='object'){var maxDate=moment(startDate).add(this.dateLimit).endOf('day');if(endDate.isAfter(maxDate)){endDate=maxDate;}}}else{startDate=this.startDate;endDate=this.rightCalendar.calendar[row][col];if(typeof this.dateLimit==='object'){var minDate=moment(endDate).subtract(this.dateLimit).startOf('day');if(startDate.isBefore(minDate)){startDate=minDate;}}}
if(this.singleDatePicker&&cal.hasClass('left')){endDate=startDate.clone();}else if(this.singleDatePicker&&cal.hasClass('right')){startDate=endDate.clone();}
cal.find('td').removeClass('active');$(e.target).addClass('active');this.setCustomDates(startDate,endDate);if(!this.timePicker)
endDate.endOf('day');if(this.singleDatePicker&&!this.timePicker)
this.clickApply();},clickApply:function(e){this.updateInputText();this.hide();this.element.trigger('apply.daterangepicker',this);},clickCancel:function(e){this.startDate=this.oldStartDate;this.endDate=this.oldEndDate;this.chosenLabel=this.oldChosenLabel;this.updateView();this.updateCalendars();this.hide();this.element.trigger('cancel.daterangepicker',this);},updateMonthYear:function(e){var isLeft=$(e.target).closest('.calendar').hasClass('left'),leftOrRight=isLeft?'left':'right',cal=this.container.find('.calendar.'+leftOrRight);var month=parseInt(cal.find('.monthselect').val(),10);var year=cal.find('.yearselect').val();if(!isLeft&&!this.singleDatePicker){if(year<this.startDate.year()||(year==this.startDate.year()&&month<this.startDate.month())){month=this.startDate.month();year=this.startDate.year();}}
if(this.minDate){if(year<this.minDate.year()||(year==this.minDate.year()&&month<this.minDate.month())){month=this.minDate.month();year=this.minDate.year();}}
if(this.maxDate){if(year>this.maxDate.year()||(year==this.maxDate.year()&&month>this.maxDate.month())){month=this.maxDate.month();year=this.maxDate.year();}}
this[leftOrRight+'Calendar'].month.month(month).year(year);this.updateCalendars();},updateTime:function(e){var cal=$(e.target).closest('.calendar'),isLeft=cal.hasClass('left');var hour=parseInt(cal.find('.hourselect').val(),10);var minute=parseInt(cal.find('.minuteselect').val(),10);var second=0;if(this.timePickerSeconds){second=parseInt(cal.find('.secondselect').val(),10);}
if(this.timePicker12Hour){var ampm=cal.find('.ampmselect').val();if(ampm==='PM'&&hour<12)
hour+=12;if(ampm==='AM'&&hour===12)
hour=0;}
if(isLeft){var start=this.startDate.clone();start.hour(hour);start.minute(minute);start.second(second);this.startDate=start;this.leftCalendar.month.hour(hour).minute(minute).second(second);if(this.singleDatePicker)
this.endDate=start.clone();}else{var end=this.endDate.clone();end.hour(hour);end.minute(minute);end.second(second);this.endDate=end;if(this.singleDatePicker)
this.startDate=end.clone();this.rightCalendar.month.hour(hour).minute(minute).second(second);}
this.updateView();this.updateCalendars();if(this.autoApply){this.notify();this.element.trigger('apply.daterangepicker',this);}},updateCalendars:function(){this.leftCalendar.calendar=this.buildCalendar(this.leftCalendar.month.month(),this.leftCalendar.month.year(),this.leftCalendar.month.hour(),this.leftCalendar.month.minute(),this.leftCalendar.month.second(),'left');this.rightCalendar.calendar=this.buildCalendar(this.rightCalendar.month.month(),this.rightCalendar.month.year(),this.rightCalendar.month.hour(),this.rightCalendar.month.minute(),this.rightCalendar.month.second(),'right');this.container.find('.calendar.left').empty().html(this.renderCalendar(this.leftCalendar.calendar,this.startDate,this.minDate,this.maxDate,'left'));this.container.find('.calendar.right').empty().html(this.renderCalendar(this.rightCalendar.calendar,this.endDate,this.singleDatePicker?this.minDate:this.startDate,this.maxDate,'right'));this.container.find('.ranges li').removeClass('active');var customRange=true;var i=0;for(var range in this.ranges){if(this.timePicker){if(this.startDate.isSame(this.ranges[range][0])&&this.endDate.isSame(this.ranges[range][1])){customRange=false;this.chosenLabel=this.container.find('.ranges li:eq('+ i+')').addClass('active').html();}}else{if(this.startDate.format('YYYY-MM-DD')==this.ranges[range][0].format('YYYY-MM-DD')&&this.endDate.format('YYYY-MM-DD')==this.ranges[range][1].format('YYYY-MM-DD')){customRange=false;this.chosenLabel=this.container.find('.ranges li:eq('+ i+')').addClass('active').html();}}
i++;}
if(customRange){this.chosenLabel=this.container.find('.ranges li:last').addClass('active').html();this.showCalendars();}},buildCalendar:function(month,year,hour,minute,second,side){var daysInMonth=moment([year,month]).daysInMonth();var firstDay=moment([year,month,1]);var lastDay=moment([year,month,daysInMonth]);var lastMonth=moment(firstDay).subtract(1,'month').month();var lastYear=moment(firstDay).subtract(1,'month').year();var daysInLastMonth=moment([lastYear,lastMonth]).daysInMonth();var dayOfWeek=firstDay.day();var i;var calendar=[];calendar.firstDay=firstDay;calendar.lastDay=lastDay;for(i=0;i<6;i++){calendar[i]=[];}
var startDay=daysInLastMonth- dayOfWeek+ this.locale.firstDay+ 1;if(startDay>daysInLastMonth)
startDay-=7;if(dayOfWeek==this.locale.firstDay)
startDay=daysInLastMonth- 6;var curDate=moment([lastYear,lastMonth,startDay,12,minute,second]);var col,row;for(i=0,col=0,row=0;i<42;i++,col++,curDate=moment(curDate).add(24,'hour')){if(i>0&&col%7===0){col=0;row++;}
calendar[row][col]=curDate.clone().hour(hour);curDate.hour(12);if(this.minDate&&calendar[row][col].format('YYYY-MM-DD')==this.minDate.format('YYYY-MM-DD')&&calendar[row][col].isBefore(this.minDate)&&side=='left'){calendar[row][col]=this.minDate.clone();}
if(this.maxDate&&calendar[row][col].format('YYYY-MM-DD')==this.maxDate.format('YYYY-MM-DD')&&calendar[row][col].isAfter(this.maxDate)&&side=='right'){calendar[row][col]=this.maxDate.clone();}}
return calendar;},renderDropdowns:function(selected,minDate,maxDate){var currentMonth=selected.month();var currentYear=selected.year();var maxYear=(maxDate&&maxDate.year())||(currentYear+ 5);var minYear=(minDate&&minDate.year())||(currentYear- 50);var monthHtml='<select class="monthselect">';var inMinYear=currentYear==minYear;var inMaxYear=currentYear==maxYear;for(var m=0;m<12;m++){if((!inMinYear||m>=minDate.month())&&(!inMaxYear||m<=maxDate.month())){monthHtml+="<option value='"+ m+"'"+
(m===currentMonth?" selected='selected'":"")+">"+ this.locale.monthNames[m]+"</option>";}}
monthHtml+="</select>";var yearHtml='<select class="yearselect">';for(var y=minYear;y<=maxYear;y++){yearHtml+='<option value="'+ y+'"'+
(y===currentYear?' selected="selected"':'')+'>'+ y+'</option>';}
yearHtml+='</select>';return monthHtml+ yearHtml;},renderCalendar:function(calendar,selected,minDate,maxDate,side){var html='<div class="calendar-date">';html+='<table class="table-condensed">';html+='<thead>';html+='<tr>';if(this.showWeekNumbers)
html+='<th></th>';if(!minDate||minDate.isBefore(calendar.firstDay)){html+='<th class="prev available"><i class="fa fa-arrow-left icon icon-maxicons1-arrowleft"></i></th>';}else{html+='<th></th>';}
var dateHtml=this.locale.monthNames[calendar[1][1].month()]+ calendar[1][1].format(" YYYY");if(this.showDropdowns){dateHtml=this.renderDropdowns(calendar[1][1],minDate,maxDate);}
html+='<th colspan="5" class="month">'+ dateHtml+'</th>';if(!maxDate||maxDate.isAfter(calendar.lastDay)){html+='<th class="next available"><i class="fa fa-arrow-right icon icon-maxicons1-arrowright"></i></th>';}else{html+='<th></th>';}
html+='</tr>';html+='<tr>';if(this.showWeekNumbers)
html+='<th class="week">'+ this.locale.weekLabel+'</th>';$.each(this.locale.daysOfWeek,function(index,dayOfWeek){html+='<th>'+ dayOfWeek+'</th>';});html+='</tr>';html+='</thead>';html+='<tbody>';for(var row=0;row<6;row++){html+='<tr>';if(this.showWeekNumbers)
html+='<td class="week">'+ calendar[row][0].week()+'</td>';for(var col=0;col<7;col++){var cname='available ';cname+=(calendar[row][col].month()==calendar[1][1].month())?'':'off';if(calendar[row][col].isSame(new Date(),"day")){cname+=' today ';}
if((minDate&&calendar[row][col].isBefore(minDate,'day'))||(maxDate&&calendar[row][col].isAfter(maxDate,'day'))){cname=' off disabled ';}else if(calendar[row][col].format('YYYY-MM-DD')==selected.format('YYYY-MM-DD')){cname+=' active ';if(calendar[row][col].format('YYYY-MM-DD')==this.startDate.format('YYYY-MM-DD')){cname+=' start-date ';}
if(calendar[row][col].format('YYYY-MM-DD')==this.endDate.format('YYYY-MM-DD')){cname+=' end-date ';}}else if(calendar[row][col]>=this.startDate&&calendar[row][col]<=this.endDate){cname+=' in-range ';if(calendar[row][col].isSame(this.startDate)){cname+=' start-date ';}
if(calendar[row][col].isSame(this.endDate)){cname+=' end-date ';}}
var title='r'+ row+'c'+ col;html+='<td class="'+ cname.replace(/\s+/g,' ').replace(/^\s?(.*?)\s?$/,'$1')+'" data-title="'+ title+'">'+ calendar[row][col].date()+'</td>';}
html+='</tr>';}
html+='</tbody>';html+='</table>';html+='</div>';var i;if(this.timePicker){html+='<div class="calendar-time">';html+='<select class="hourselect">';var min_hour=0;var max_hour=23;if(minDate&&(side=='left'||this.singleDatePicker)&&selected.format('YYYY-MM-DD')==minDate.format('YYYY-MM-DD')){min_hour=minDate.hour();if(selected.hour()<min_hour)
selected.hour(min_hour);if(this.timePicker12Hour&&min_hour>=12&&selected.hour()>=12)
min_hour-=12;if(this.timePicker12Hour&&min_hour==12)
min_hour=1;}
if(maxDate&&(side=='right'||this.singleDatePicker)&&selected.format('YYYY-MM-DD')==maxDate.format('YYYY-MM-DD')){max_hour=maxDate.hour();if(selected.hour()>max_hour)
selected.hour(max_hour);if(this.timePicker12Hour&&max_hour>=12&&selected.hour()>=12)
max_hour-=12;}
var start=0;var end=23;var selected_hour=selected.hour();if(this.timePicker12Hour){start=1;end=12;if(selected_hour>=12)
selected_hour-=12;if(selected_hour===0)
selected_hour=12;}
for(i=start;i<=end;i++){if(i==selected_hour){html+='<option value="'+ i+'" selected="selected">'+ i+'</option>';}else if(i<min_hour||i>max_hour){html+='<option value="'+ i+'" disabled="disabled" class="disabled">'+ i+'</option>';}else{html+='<option value="'+ i+'">'+ i+'</option>';}}
html+='</select> : ';html+='<select class="minuteselect">';var min_minute=0;var max_minute=59;if(minDate&&(side=='left'||this.singleDatePicker)&&selected.format('YYYY-MM-DD h A')==minDate.format('YYYY-MM-DD h A')){min_minute=minDate.minute();if(selected.minute()<min_minute)
selected.minute(min_minute);}
if(maxDate&&(side=='right'||this.singleDatePicker)&&selected.format('YYYY-MM-DD h A')==maxDate.format('YYYY-MM-DD h A')){max_minute=maxDate.minute();if(selected.minute()>max_minute)
selected.minute(max_minute);}
for(i=0;i<60;i+=this.timePickerIncrement){var num=i;if(num<10)
num='0'+ num;if(i==selected.minute()){html+='<option value="'+ i+'" selected="selected">'+ num+'</option>';}else if(i<min_minute||i>max_minute){html+='<option value="'+ i+'" disabled="disabled" class="disabled">'+ num+'</option>';}else{html+='<option value="'+ i+'">'+ num+'</option>';}}
html+='</select> ';if(this.timePickerSeconds){html+=': <select class="secondselect">';for(i=0;i<60;i+=this.timePickerIncrement){var num=i;if(num<10)
num='0'+ num;if(i==selected.second()){html+='<option value="'+ i+'" selected="selected">'+ num+'</option>';}else{html+='<option value="'+ i+'">'+ num+'</option>';}}
html+='</select>';}
if(this.timePicker12Hour){html+='<select class="ampmselect">';var am_html='';var pm_html='';if(minDate&&(side=='left'||this.singleDatePicker)&&selected.format('YYYY-MM-DD')==minDate.format('YYYY-MM-DD')&&minDate.hour()>=12){am_html=' disabled="disabled" class="disabled"';}
if(maxDate&&(side=='right'||this.singleDatePicker)&&selected.format('YYYY-MM-DD')==maxDate.format('YYYY-MM-DD')&&maxDate.hour()<12){pm_html=' disabled="disabled" class="disabled"';}
if(selected.hour()>=12){html+='<option value="AM"'+ am_html+'>AM</option><option value="PM" selected="selected"'+ pm_html+'>PM</option>';}else{html+='<option value="AM" selected="selected"'+ am_html+'>AM</option><option value="PM"'+ pm_html+'>PM</option>';}
html+='</select>';}
html+='</div>';}
return html;},remove:function(){this.container.remove();this.element.off('.daterangepicker');this.element.removeData('daterangepicker');}};$.fn.daterangepicker=function(options,cb){this.each(function(){var el=$(this);if(el.data('daterangepicker'))
el.data('daterangepicker').remove();el.data('daterangepicker',new DateRangePicker(el,options,cb));});return this;};}));
(function($,undefined){function UTCDate(){return new Date(Date.UTC.apply(Date,arguments));}
function UTCToday(){var today=new Date();return UTCDate(today.getFullYear(),today.getMonth(),today.getDate());}
function isUTCEquals(date1,date2){return(date1.getUTCFullYear()===date2.getUTCFullYear()&&date1.getUTCMonth()===date2.getUTCMonth()&&date1.getUTCDate()===date2.getUTCDate());}
function alias(method){return function(){return this[method].apply(this,arguments);};}
var DateArray=(function(){var extras={get:function(i){return this.slice(i)[0];},contains:function(d){var val=d&&d.valueOf();for(var i=0,l=this.length;i<l;i++)
if(this[i].valueOf()===val)
return i;return-1;},remove:function(i){this.splice(i,1);},replace:function(new_array){if(!new_array)
return;if(!$.isArray(new_array))
new_array=[new_array];this.clear();this.push.apply(this,new_array);},clear:function(){this.length=0;},copy:function(){var a=new DateArray();a.replace(this);return a;}};return function(){var a=[];a.push.apply(a,arguments);$.extend(a,extras);return a;};})();var Datepicker=function(element,options){this._process_options(options);this.dates=new DateArray();this.viewDate=this.o.defaultViewDate;this.focusDate=null;this.element=$(element);this.isInline=false;this.isInput=this.element.is('input');this.component=this.element.hasClass('date')?this.element.find('.add-on, .input-group-addon, .btn'):false;this.hasInput=this.component&&this.element.find('input').length;if(this.component&&this.component.length===0)
this.component=false;this.picker=$(DPGlobal.template);this._buildEvents();this._attachEvents();if(this.isInline){this.picker.addClass('datepicker-inline').appendTo(this.element);}
else{this.picker.addClass('datepicker-dropdown dropdown-menu');}
if(this.o.rtl){this.picker.addClass('datepicker-rtl');}
this.viewMode=this.o.startView;if(this.o.calendarWeeks)
this.picker.find('tfoot .today, tfoot .clear').attr('colspan',function(i,val){return parseInt(val)+ 1;});this._allow_update=false;this.setStartDate(this._o.startDate);this.setEndDate(this._o.endDate);this.setDaysOfWeekDisabled(this.o.daysOfWeekDisabled);this.setDatesDisabled(this.o.datesDisabled);this.fillDow();this.fillMonths();this._allow_update=true;this.update();this.showMode();if(this.isInline){this.show();}};Datepicker.prototype={constructor:Datepicker,_process_options:function(opts){this._o=$.extend({},this._o,opts);var o=this.o=$.extend({},this._o);var lang=o.language;if(!dates[lang]){lang=lang.split('-')[0];if(!dates[lang])
lang=defaults.language;}
o.language=lang;switch(o.startView){case 2:case'decade':o.startView=2;break;case 1:case'year':o.startView=1;break;default:o.startView=0;}
switch(o.minViewMode){case 1:case'months':o.minViewMode=1;break;case 2:case'years':o.minViewMode=2;break;default:o.minViewMode=0;}
o.startView=Math.max(o.startView,o.minViewMode);if(o.multidate!==true){o.multidate=Number(o.multidate)||false;if(o.multidate!==false)
o.multidate=Math.max(0,o.multidate);}
o.multidateSeparator=String(o.multidateSeparator);o.weekStart%=7;o.weekEnd=((o.weekStart+ 6)%7);var format=DPGlobal.parseFormat(o.format);if(o.startDate!==-Infinity){if(!!o.startDate){if(o.startDate instanceof Date)
o.startDate=this._local_to_utc(this._zero_time(o.startDate));else
o.startDate=DPGlobal.parseDate(o.startDate,format,o.language);}
else{o.startDate=-Infinity;}}
if(o.endDate!==Infinity){if(!!o.endDate){if(o.endDate instanceof Date)
o.endDate=this._local_to_utc(this._zero_time(o.endDate));else
o.endDate=DPGlobal.parseDate(o.endDate,format,o.language);}
else{o.endDate=Infinity;}}
o.daysOfWeekDisabled=o.daysOfWeekDisabled||[];if(!$.isArray(o.daysOfWeekDisabled))
o.daysOfWeekDisabled=o.daysOfWeekDisabled.split(/[,\s]*/);o.daysOfWeekDisabled=$.map(o.daysOfWeekDisabled,function(d){return parseInt(d,10);});o.datesDisabled=o.datesDisabled||[];if(!$.isArray(o.datesDisabled)){var datesDisabled=[];datesDisabled.push(DPGlobal.parseDate(o.datesDisabled,format,o.language));o.datesDisabled=datesDisabled;}
o.datesDisabled=$.map(o.datesDisabled,function(d){return DPGlobal.parseDate(d,format,o.language);});var plc=String(o.orientation).toLowerCase().split(/\s+/g),_plc=o.orientation.toLowerCase();plc=$.grep(plc,function(word){return/^auto|left|right|top|bottom$/.test(word);});o.orientation={x:'auto',y:'auto'};if(!_plc||_plc==='auto');else if(plc.length===1){switch(plc[0]){case'top':case'bottom':o.orientation.y=plc[0];break;case'left':case'right':o.orientation.x=plc[0];break;}}
else{_plc=$.grep(plc,function(word){return/^left|right$/.test(word);});o.orientation.x=_plc[0]||'auto';_plc=$.grep(plc,function(word){return/^top|bottom$/.test(word);});o.orientation.y=_plc[0]||'auto';}
if(o.defaultViewDate){var year=o.defaultViewDate.year||new Date().getFullYear();var month=o.defaultViewDate.month||0;var day=o.defaultViewDate.day||1;o.defaultViewDate=UTCDate(year,month,day);}else{o.defaultViewDate=UTCToday();}
o.showOnFocus=o.showOnFocus!==undefined?o.showOnFocus:true;},_events:[],_secondaryEvents:[],_applyEvents:function(evs){for(var i=0,el,ch,ev;i<evs.length;i++){el=evs[i][0];if(evs[i].length===2){ch=undefined;ev=evs[i][1];}
else if(evs[i].length===3){ch=evs[i][1];ev=evs[i][2];}
el.on(ev,ch);}},_unapplyEvents:function(evs){for(var i=0,el,ev,ch;i<evs.length;i++){el=evs[i][0];if(evs[i].length===2){ch=undefined;ev=evs[i][1];}
else if(evs[i].length===3){ch=evs[i][1];ev=evs[i][2];}
el.off(ev,ch);}},_buildEvents:function(){var events={keyup:$.proxy(function(e){if($.inArray(e.keyCode,[27,37,39,38,40,32,13,9])===-1)
this.update();},this),keydown:$.proxy(this.keydown,this)};if(this.o.showOnFocus===true){events.focus=$.proxy(this.show,this);}
if(this.isInput){this._events=[[this.element,events]];}
else if(this.component&&this.hasInput){this._events=[[this.element.find('input'),events],[this.component,{click:$.proxy(this.show,this)}]];}
else if(this.element.is('div')){this.isInline=true;}
else{this._events=[[this.element,{click:$.proxy(this.show,this)}]];}
this._events.push([this.element,'*',{blur:$.proxy(function(e){this._focused_from=e.target;},this)}],[this.element,{blur:$.proxy(function(e){this._focused_from=e.target;},this)}]);this._secondaryEvents=[[this.picker,{click:$.proxy(this.click,this)}],[$(window),{resize:$.proxy(this.place,this)}],[$(document),{'mousedown touchstart':$.proxy(function(e){if(!(this.element.is(e.target)||this.element.find(e.target).length||this.picker.is(e.target)||this.picker.find(e.target).length)){this.hide();}},this)}]];},_attachEvents:function(){this._detachEvents();this._applyEvents(this._events);},_detachEvents:function(){this._unapplyEvents(this._events);},_attachSecondaryEvents:function(){this._detachSecondaryEvents();this._applyEvents(this._secondaryEvents);},_detachSecondaryEvents:function(){this._unapplyEvents(this._secondaryEvents);},_trigger:function(event,altdate){var date=altdate||this.dates.get(-1),local_date=this._utc_to_local(date);this.element.trigger({type:event,date:local_date,dates:$.map(this.dates,this._utc_to_local),format:$.proxy(function(ix,format){if(arguments.length===0){ix=this.dates.length- 1;format=this.o.format;}
else if(typeof ix==='string'){format=ix;ix=this.dates.length- 1;}
format=format||this.o.format;var date=this.dates.get(ix);return DPGlobal.formatDate(date,format,this.o.language);},this)});},show:function(){if(this.element.attr('readonly')&&this.o.enableOnReadonly===false)
return;if(!this.isInline)
this.picker.appendTo(this.o.container);this.place();this.picker.show();this._attachSecondaryEvents();this._trigger('show');if((window.navigator.msMaxTouchPoints||'ontouchstart'in document)&&this.o.disableTouchKeyboard){$(this.element).blur();}
return this;},hide:function(){if(this.isInline)
return this;if(!this.picker.is(':visible'))
return this;this.focusDate=null;this.picker.hide().detach();this._detachSecondaryEvents();this.viewMode=this.o.startView;this.showMode();if(this.o.forceParse&&(this.isInput&&this.element.val()||this.hasInput&&this.element.find('input').val()))
this.setValue();this._trigger('hide');return this;},remove:function(){this.hide();this._detachEvents();this._detachSecondaryEvents();this.picker.remove();delete this.element.data().datepicker;if(!this.isInput){delete this.element.data().date;}
return this;},_utc_to_local:function(utc){return utc&&new Date(utc.getTime()+(utc.getTimezoneOffset()*60000));},_local_to_utc:function(local){return local&&new Date(local.getTime()-(local.getTimezoneOffset()*60000));},_zero_time:function(local){return local&&new Date(local.getFullYear(),local.getMonth(),local.getDate());},_zero_utc_time:function(utc){return utc&&new Date(Date.UTC(utc.getUTCFullYear(),utc.getUTCMonth(),utc.getUTCDate()));},getDates:function(){return $.map(this.dates,this._utc_to_local);},getUTCDates:function(){return $.map(this.dates,function(d){return new Date(d);});},getDate:function(){return this._utc_to_local(this.getUTCDate());},getUTCDate:function(){var selected_date=this.dates.get(-1);if(typeof selected_date!=='undefined'){return new Date(selected_date);}else{return null;}},clearDates:function(){var element;if(this.isInput){element=this.element;}else if(this.component){element=this.element.find('input');}
if(element){element.val('').change();}
this.update();this._trigger('changeDate');if(this.o.autoclose){this.hide();}},setDates:function(){var args=$.isArray(arguments[0])?arguments[0]:arguments;this.update.apply(this,args);this._trigger('changeDate');this.setValue();return this;},setUTCDates:function(){var args=$.isArray(arguments[0])?arguments[0]:arguments;this.update.apply(this,$.map(args,this._utc_to_local));this._trigger('changeDate');this.setValue();return this;},setDate:alias('setDates'),setUTCDate:alias('setUTCDates'),setValue:function(){var formatted=this.getFormattedDate();if(!this.isInput){if(this.component){this.element.find('input').val(formatted).change();}}
else{this.element.val(formatted).change();}
return this;},getFormattedDate:function(format){if(format===undefined)
format=this.o.format;var lang=this.o.language;return $.map(this.dates,function(d){return DPGlobal.formatDate(d,format,lang);}).join(this.o.multidateSeparator);},setStartDate:function(startDate){this._process_options({startDate:startDate});this.update();this.updateNavArrows();return this;},setEndDate:function(endDate){this._process_options({endDate:endDate});this.update();this.updateNavArrows();return this;},setDaysOfWeekDisabled:function(daysOfWeekDisabled){this._process_options({daysOfWeekDisabled:daysOfWeekDisabled});this.update();this.updateNavArrows();return this;},setDatesDisabled:function(datesDisabled){this._process_options({datesDisabled:datesDisabled});this.update();this.updateNavArrows();},place:function(){if(this.isInline)
return this;var calendarWidth=this.picker.outerWidth(),calendarHeight=this.picker.outerHeight(),visualPadding=10,windowWidth=$(this.o.container).width(),windowHeight=$(this.o.container).height(),scrollTop=$(this.o.container).scrollTop(),appendOffset=$(this.o.container).offset();var parentsZindex=[];this.element.parents().each(function(){var itemZIndex=$(this).css('z-index');if(itemZIndex!=='auto'&&itemZIndex!==0)parentsZindex.push(parseInt(itemZIndex));});var zIndex=Math.max.apply(Math,parentsZindex)+ 10;var offset=this.component?this.component.parent().offset():this.element.offset();var height=this.component?this.component.outerHeight(true):this.element.outerHeight(false);var width=this.component?this.component.outerWidth(true):this.element.outerWidth(false);var left=offset.left- appendOffset.left,top=offset.top- appendOffset.top;this.picker.removeClass('datepicker-orient-top datepicker-orient-bottom '+'datepicker-orient-right datepicker-orient-left');if(this.o.orientation.x!=='auto'){this.picker.addClass('datepicker-orient-'+ this.o.orientation.x);if(this.o.orientation.x==='right')
left-=calendarWidth- width;}
else{if(offset.left<0){this.picker.addClass('datepicker-orient-left');left-=offset.left- visualPadding;}else if(left+ calendarWidth>windowWidth){this.picker.addClass('datepicker-orient-right');left=offset.left+ width- calendarWidth;}else{this.picker.addClass('datepicker-orient-left');}}
var yorient=this.o.orientation.y,top_overflow,bottom_overflow;if(yorient==='auto'){top_overflow=-scrollTop+ top- calendarHeight;bottom_overflow=scrollTop+ windowHeight-(top+ height+ calendarHeight);if(Math.max(top_overflow,bottom_overflow)===bottom_overflow)
yorient='top';else
yorient='bottom';}
this.picker.addClass('datepicker-orient-'+ yorient);if(yorient==='top')
top+=height;else
top-=calendarHeight+ parseInt(this.picker.css('padding-top'));if(this.o.rtl){var right=windowWidth-(left+ width);this.picker.css({top:top,right:right,zIndex:zIndex});}else{this.picker.css({top:top,left:left,zIndex:zIndex});}
return this;},_allow_update:true,update:function(){if(!this._allow_update)
return this;var oldDates=this.dates.copy(),dates=[],fromArgs=false;if(arguments.length){$.each(arguments,$.proxy(function(i,date){if(date instanceof Date)
date=this._local_to_utc(date);dates.push(date);},this));fromArgs=true;}
else{dates=this.isInput?this.element.val():this.element.data('date')||this.element.find('input').val();if(dates&&this.o.multidate)
dates=dates.split(this.o.multidateSeparator);else
dates=[dates];delete this.element.data().date;}
dates=$.map(dates,$.proxy(function(date){return DPGlobal.parseDate(date,this.o.format,this.o.language);},this));dates=$.grep(dates,$.proxy(function(date){return(date<this.o.startDate||date>this.o.endDate||!date);},this),true);this.dates.replace(dates);if(this.dates.length)
this.viewDate=new Date(this.dates.get(-1));else if(this.viewDate<this.o.startDate)
this.viewDate=new Date(this.o.startDate);else if(this.viewDate>this.o.endDate)
this.viewDate=new Date(this.o.endDate);if(fromArgs){this.setValue();}
else if(dates.length){if(String(oldDates)!==String(this.dates))
this._trigger('changeDate');}
if(!this.dates.length&&oldDates.length)
this._trigger('clearDate');this.fill();return this;},fillDow:function(){var dowCnt=this.o.weekStart,html='<tr>';if(this.o.calendarWeeks){this.picker.find('.datepicker-days thead tr:first-child .datepicker-switch').attr('colspan',function(i,val){return parseInt(val)+ 1;});var cell='<th class="cw">&#160;</th>';html+=cell;}
while(dowCnt<this.o.weekStart+ 7){html+='<th class="dow">'+dates[this.o.language].daysMin[(dowCnt++)%7]+'</th>';}
html+='</tr>';this.picker.find('.datepicker-days thead').append(html);},fillMonths:function(){var html='',i=0;while(i<12){html+='<span class="month">'+dates[this.o.language].monthsShort[i++]+'</span>';}
this.picker.find('.datepicker-months td').html(html);},setRange:function(range){if(!range||!range.length)
delete this.range;else
this.range=$.map(range,function(d){return d.valueOf();});this.fill();},getClassNames:function(date){var cls=[],year=this.viewDate.getUTCFullYear(),month=this.viewDate.getUTCMonth(),today=new Date();if(date.getUTCFullYear()<year||(date.getUTCFullYear()===year&&date.getUTCMonth()<month)){cls.push('old');}
else if(date.getUTCFullYear()>year||(date.getUTCFullYear()===year&&date.getUTCMonth()>month)){cls.push('new');}
if(this.focusDate&&date.valueOf()===this.focusDate.valueOf())
cls.push('focused');if(this.o.todayHighlight&&date.getUTCFullYear()===today.getFullYear()&&date.getUTCMonth()===today.getMonth()&&date.getUTCDate()===today.getDate()){cls.push('today');}
if(this.dates.contains(date)!==-1)
cls.push('active');if(date.valueOf()<this.o.startDate||date.valueOf()>this.o.endDate||$.inArray(date.getUTCDay(),this.o.daysOfWeekDisabled)!==-1){cls.push('disabled');}
if(this.o.datesDisabled.length>0&&$.grep(this.o.datesDisabled,function(d){return isUTCEquals(date,d);}).length>0){cls.push('disabled','disabled-date');}
if(this.range){if(date>this.range[0]&&date<this.range[this.range.length-1]){cls.push('range');}
if($.inArray(date.valueOf(),this.range)!==-1){cls.push('selected');}}
return cls;},fill:function(){var d=new Date(this.viewDate),year=d.getUTCFullYear(),month=d.getUTCMonth(),startYear=this.o.startDate!==-Infinity?this.o.startDate.getUTCFullYear():-Infinity,startMonth=this.o.startDate!==-Infinity?this.o.startDate.getUTCMonth():-Infinity,endYear=this.o.endDate!==Infinity?this.o.endDate.getUTCFullYear():Infinity,endMonth=this.o.endDate!==Infinity?this.o.endDate.getUTCMonth():Infinity,todaytxt=dates[this.o.language].today||dates['en'].today||'',cleartxt=dates[this.o.language].clear||dates['en'].clear||'',tooltip;if(isNaN(year)||isNaN(month))
return;this.picker.find('.datepicker-days thead .datepicker-switch').text(dates[this.o.language].months[month]+' '+year);this.picker.find('tfoot .today').text(todaytxt).toggle(this.o.todayBtn!==false);this.picker.find('tfoot .clear').text(cleartxt).toggle(this.o.clearBtn!==false);this.updateNavArrows();this.fillMonths();var prevMonth=UTCDate(year,month-1,28),day=DPGlobal.getDaysInMonth(prevMonth.getUTCFullYear(),prevMonth.getUTCMonth());prevMonth.setUTCDate(day);prevMonth.setUTCDate(day-(prevMonth.getUTCDay()- this.o.weekStart+ 7)%7);var nextMonth=new Date(prevMonth);nextMonth.setUTCDate(nextMonth.getUTCDate()+ 42);nextMonth=nextMonth.valueOf();var html=[];var clsName;while(prevMonth.valueOf()<nextMonth){if(prevMonth.getUTCDay()===this.o.weekStart){html.push('<tr>');if(this.o.calendarWeeks){var
ws=new Date(+prevMonth+(this.o.weekStart- prevMonth.getUTCDay()- 7)%7*864e5),th=new Date(Number(ws)+(7+ 4- ws.getUTCDay())%7*864e5),yth=new Date(Number(yth=UTCDate(th.getUTCFullYear(),0,1))+(7+ 4- yth.getUTCDay())%7*864e5),calWeek=(th- yth)/ 864e5 / 7 + 1;
html.push('<td class="cw">'+ calWeek+'</td>');}}
clsName=this.getClassNames(prevMonth);clsName.push('day');if(this.o.beforeShowDay!==$.noop){var before=this.o.beforeShowDay(this._utc_to_local(prevMonth));if(before===undefined)
before={};else if(typeof(before)==='boolean')
before={enabled:before};else if(typeof(before)==='string')
before={classes:before};if(before.enabled===false)
clsName.push('disabled');if(before.classes)
clsName=clsName.concat(before.classes.split(/\s+/));if(before.tooltip)
tooltip=before.tooltip;}
clsName=$.unique(clsName);html.push('<td class="'+clsName.join(' ')+'"'+(tooltip?' title="'+tooltip+'"':'')+'>'+prevMonth.getUTCDate()+'</td>');tooltip=null;if(prevMonth.getUTCDay()===this.o.weekEnd){html.push('</tr>');}
prevMonth.setUTCDate(prevMonth.getUTCDate()+1);}
this.picker.find('.datepicker-days tbody').empty().append(html.join(''));var months=this.picker.find('.datepicker-months').find('th:eq(1)').text(year).end().find('span').removeClass('active');$.each(this.dates,function(i,d){if(d.getUTCFullYear()===year)
months.eq(d.getUTCMonth()).addClass('active');});if(year<startYear||year>endYear){months.addClass('disabled');}
if(year===startYear){months.slice(0,startMonth).addClass('disabled');}
if(year===endYear){months.slice(endMonth+1).addClass('disabled');}
if(this.o.beforeShowMonth!==$.noop){var that=this;$.each(months,function(i,month){if(!$(month).hasClass('disabled')){var moDate=new Date(year,i,1);var before=that.o.beforeShowMonth(moDate);if(before===false)
$(month).addClass('disabled');}});}
html='';year=parseInt(year/10,10)*10;var yearCont=this.picker.find('.datepicker-years').find('th:eq(1)').text(year+'-'+(year+ 9)).end().find('td');year-=1;var years=$.map(this.dates,function(d){return d.getUTCFullYear();}),classes;for(var i=-1;i<11;i++){classes=['year'];if(i===-1)
classes.push('old');else if(i===10)
classes.push('new');if($.inArray(year,years)!==-1)
classes.push('active');if(year<startYear||year>endYear)
classes.push('disabled');html+='<span class="'+ classes.join(' ')+'">'+ year+'</span>';year+=1;}
yearCont.html(html);},updateNavArrows:function(){if(!this._allow_update)
return;var d=new Date(this.viewDate),year=d.getUTCFullYear(),month=d.getUTCMonth();switch(this.viewMode){case 0:if(this.o.startDate!==-Infinity&&year<=this.o.startDate.getUTCFullYear()&&month<=this.o.startDate.getUTCMonth()){this.picker.find('.prev').css({visibility:'hidden'});}
else{this.picker.find('.prev').css({visibility:'visible'});}
if(this.o.endDate!==Infinity&&year>=this.o.endDate.getUTCFullYear()&&month>=this.o.endDate.getUTCMonth()){this.picker.find('.next').css({visibility:'hidden'});}
else{this.picker.find('.next').css({visibility:'visible'});}
break;case 1:case 2:if(this.o.startDate!==-Infinity&&year<=this.o.startDate.getUTCFullYear()){this.picker.find('.prev').css({visibility:'hidden'});}
else{this.picker.find('.prev').css({visibility:'visible'});}
if(this.o.endDate!==Infinity&&year>=this.o.endDate.getUTCFullYear()){this.picker.find('.next').css({visibility:'hidden'});}
else{this.picker.find('.next').css({visibility:'visible'});}
break;}},click:function(e){e.preventDefault();var target=$(e.target).closest('span, td, th'),year,month,day;if(target.length===1){switch(target[0].nodeName.toLowerCase()){case'th':switch(target[0].className){case'datepicker-switch':this.showMode(1);break;case'prev':case'next':var dir=DPGlobal.modes[this.viewMode].navStep*(target[0].className==='prev'?-1:1);switch(this.viewMode){case 0:this.viewDate=this.moveMonth(this.viewDate,dir);this._trigger('changeMonth',this.viewDate);break;case 1:case 2:this.viewDate=this.moveYear(this.viewDate,dir);if(this.viewMode===1)
this._trigger('changeYear',this.viewDate);break;}
this.fill();break;case'today':var date=new Date();date=UTCDate(date.getFullYear(),date.getMonth(),date.getDate(),0,0,0);this.showMode(-2);var which=this.o.todayBtn==='linked'?null:'view';this._setDate(date,which);break;case'clear':this.clearDates();break;}
break;case'span':if(!target.hasClass('disabled')){this.viewDate.setUTCDate(1);if(target.hasClass('month')){day=1;month=target.parent().find('span').index(target);year=this.viewDate.getUTCFullYear();this.viewDate.setUTCMonth(month);this._trigger('changeMonth',this.viewDate);if(this.o.minViewMode===1){this._setDate(UTCDate(year,month,day));}}
else{day=1;month=0;year=parseInt(target.text(),10)||0;this.viewDate.setUTCFullYear(year);this._trigger('changeYear',this.viewDate);if(this.o.minViewMode===2){this._setDate(UTCDate(year,month,day));}}
this.showMode(-1);this.fill();}
break;case'td':if(target.hasClass('day')&&!target.hasClass('disabled')){day=parseInt(target.text(),10)||1;year=this.viewDate.getUTCFullYear();month=this.viewDate.getUTCMonth();if(target.hasClass('old')){if(month===0){month=11;year-=1;}
else{month-=1;}}
else if(target.hasClass('new')){if(month===11){month=0;year+=1;}
else{month+=1;}}
this._setDate(UTCDate(year,month,day));}
break;}}
if(this.picker.is(':visible')&&this._focused_from){$(this._focused_from).focus();}
delete this._focused_from;},_toggle_multidate:function(date){var ix=this.dates.contains(date);if(!date){this.dates.clear();}
if(ix!==-1){if(this.o.multidate===true||this.o.multidate>1||this.o.toggleActive){this.dates.remove(ix);}}else if(this.o.multidate===false){this.dates.clear();this.dates.push(date);}
else{this.dates.push(date);}
if(typeof this.o.multidate==='number')
while(this.dates.length>this.o.multidate)
this.dates.remove(0);},_setDate:function(date,which){if(!which||which==='date')
this._toggle_multidate(date&&new Date(date));if(!which||which==='view')
this.viewDate=date&&new Date(date);this.fill();this.setValue();if(!which||which!=='view'){this._trigger('changeDate');}
var element;if(this.isInput){element=this.element;}
else if(this.component){element=this.element.find('input');}
if(element){element.change();}
if(this.o.autoclose&&(!which||which==='date')){this.hide();}},moveMonth:function(date,dir){if(!date)
return undefined;if(!dir)
return date;var new_date=new Date(date.valueOf()),day=new_date.getUTCDate(),month=new_date.getUTCMonth(),mag=Math.abs(dir),new_month,test;dir=dir>0?1:-1;if(mag===1){test=dir===-1?function(){return new_date.getUTCMonth()===month;}:function(){return new_date.getUTCMonth()!==new_month;};new_month=month+ dir;new_date.setUTCMonth(new_month);if(new_month<0||new_month>11)
new_month=(new_month+ 12)%12;}
else{for(var i=0;i<mag;i++)
new_date=this.moveMonth(new_date,dir);new_month=new_date.getUTCMonth();new_date.setUTCDate(day);test=function(){return new_month!==new_date.getUTCMonth();};}
while(test()){new_date.setUTCDate(--day);new_date.setUTCMonth(new_month);}
return new_date;},moveYear:function(date,dir){return this.moveMonth(date,dir*12);},dateWithinRange:function(date){return date>=this.o.startDate&&date<=this.o.endDate;},keydown:function(e){if(!this.picker.is(':visible')){if(e.keyCode===27)
this.show();return;}
var dateChanged=false,dir,newDate,newViewDate,focusDate=this.focusDate||this.viewDate;switch(e.keyCode){case 27:if(this.focusDate){this.focusDate=null;this.viewDate=this.dates.get(-1)||this.viewDate;this.fill();}
else
this.hide();e.preventDefault();break;case 37:case 39:if(!this.o.keyboardNavigation)
break;dir=e.keyCode===37?-1:1;if(e.ctrlKey){newDate=this.moveYear(this.dates.get(-1)||UTCToday(),dir);newViewDate=this.moveYear(focusDate,dir);this._trigger('changeYear',this.viewDate);}
else if(e.shiftKey){newDate=this.moveMonth(this.dates.get(-1)||UTCToday(),dir);newViewDate=this.moveMonth(focusDate,dir);this._trigger('changeMonth',this.viewDate);}
else{newDate=new Date(this.dates.get(-1)||UTCToday());newDate.setUTCDate(newDate.getUTCDate()+ dir);newViewDate=new Date(focusDate);newViewDate.setUTCDate(focusDate.getUTCDate()+ dir);}
if(this.dateWithinRange(newViewDate)){this.focusDate=this.viewDate=newViewDate;this.setValue();this.fill();e.preventDefault();}
break;case 38:case 40:if(!this.o.keyboardNavigation)
break;dir=e.keyCode===38?-1:1;if(e.ctrlKey){newDate=this.moveYear(this.dates.get(-1)||UTCToday(),dir);newViewDate=this.moveYear(focusDate,dir);this._trigger('changeYear',this.viewDate);}
else if(e.shiftKey){newDate=this.moveMonth(this.dates.get(-1)||UTCToday(),dir);newViewDate=this.moveMonth(focusDate,dir);this._trigger('changeMonth',this.viewDate);}
else{newDate=new Date(this.dates.get(-1)||UTCToday());newDate.setUTCDate(newDate.getUTCDate()+ dir*7);newViewDate=new Date(focusDate);newViewDate.setUTCDate(focusDate.getUTCDate()+ dir*7);}
if(this.dateWithinRange(newViewDate)){this.focusDate=this.viewDate=newViewDate;this.setValue();this.fill();e.preventDefault();}
break;case 32:break;case 13:focusDate=this.focusDate||this.dates.get(-1)||this.viewDate;if(this.o.keyboardNavigation){this._toggle_multidate(focusDate);dateChanged=true;}
this.focusDate=null;this.viewDate=this.dates.get(-1)||this.viewDate;this.setValue();this.fill();if(this.picker.is(':visible')){e.preventDefault();if(typeof e.stopPropagation==='function'){e.stopPropagation();}else{e.cancelBubble=true;}
if(this.o.autoclose)
this.hide();}
break;case 9:this.focusDate=null;this.viewDate=this.dates.get(-1)||this.viewDate;this.fill();this.hide();break;}
if(dateChanged){if(this.dates.length)
this._trigger('changeDate');else
this._trigger('clearDate');var element;if(this.isInput){element=this.element;}
else if(this.component){element=this.element.find('input');}
if(element){element.change();}}},showMode:function(dir){if(dir){this.viewMode=Math.max(this.o.minViewMode,Math.min(2,this.viewMode+ dir));}
this.picker.children('div').hide().filter('.datepicker-'+ DPGlobal.modes[this.viewMode].clsName).css('display','block');this.updateNavArrows();}};var DateRangePicker=function(element,options){this.element=$(element);this.inputs=$.map(options.inputs,function(i){return i.jquery?i[0]:i;});delete options.inputs;datepickerPlugin.call($(this.inputs),options).bind('changeDate',$.proxy(this.dateUpdated,this));this.pickers=$.map(this.inputs,function(i){return $(i).data('datepicker');});this.updateDates();};DateRangePicker.prototype={updateDates:function(){this.dates=$.map(this.pickers,function(i){return i.getUTCDate();});this.updateRanges();},updateRanges:function(){var range=$.map(this.dates,function(d){return d.valueOf();});$.each(this.pickers,function(i,p){p.setRange(range);});},dateUpdated:function(e){if(this.updating)
return;this.updating=true;var dp=$(e.target).data('datepicker'),new_date=dp.getUTCDate(),i=$.inArray(e.target,this.inputs),j=i- 1,k=i+ 1,l=this.inputs.length;if(i===-1)
return;$.each(this.pickers,function(i,p){if(!p.getUTCDate())
p.setUTCDate(new_date);});if(new_date<this.dates[j]){while(j>=0&&new_date<this.dates[j]){this.pickers[j--].setUTCDate(new_date);}}
else if(new_date>this.dates[k]){while(k<l&&new_date>this.dates[k]){this.pickers[k++].setUTCDate(new_date);}}
this.updateDates();delete this.updating;},remove:function(){$.map(this.pickers,function(p){p.remove();});delete this.element.data().datepicker;}};function opts_from_el(el,prefix){var data=$(el).data(),out={},inkey,replace=new RegExp('^'+ prefix.toLowerCase()+'([A-Z])');prefix=new RegExp('^'+ prefix.toLowerCase());function re_lower(_,a){return a.toLowerCase();}
for(var key in data)
if(prefix.test(key)){inkey=key.replace(replace,re_lower);out[inkey]=data[key];}
return out;}
function opts_from_locale(lang){var out={};if(!dates[lang]){lang=lang.split('-')[0];if(!dates[lang])
return;}
var d=dates[lang];$.each(locale_opts,function(i,k){if(k in d)
out[k]=d[k];});return out;}
var old=$.fn.datepicker;var datepickerPlugin=function(option){var args=Array.apply(null,arguments);args.shift();var internal_return;this.each(function(){var $this=$(this),data=$this.data('datepicker'),options=typeof option==='object'&&option;if(!data){var elopts=opts_from_el(this,'date'),xopts=$.extend({},defaults,elopts,options),locopts=opts_from_locale(xopts.language),opts=$.extend({},defaults,locopts,elopts,options);if($this.hasClass('input-daterange')||opts.inputs){var ropts={inputs:opts.inputs||$this.find('input').toArray()};$this.data('datepicker',(data=new DateRangePicker(this,$.extend(opts,ropts))));}
else{$this.data('datepicker',(data=new Datepicker(this,opts)));}}
if(typeof option==='string'&&typeof data[option]==='function'){internal_return=data[option].apply(data,args);if(internal_return!==undefined)
return false;}});if(internal_return!==undefined)
return internal_return;else
return this;};$.fn.datepicker=datepickerPlugin;var defaults=$.fn.datepicker.defaults={autoclose:false,beforeShowDay:$.noop,beforeShowMonth:$.noop,calendarWeeks:false,clearBtn:false,toggleActive:false,daysOfWeekDisabled:[],datesDisabled:[],endDate:Infinity,forceParse:true,format:'mm/dd/yyyy',keyboardNavigation:true,language:'en',minViewMode:0,multidate:false,multidateSeparator:',',orientation:"auto",rtl:false,startDate:-Infinity,startView:0,todayBtn:false,todayHighlight:false,weekStart:0,disableTouchKeyboard:false,enableOnReadonly:true,container:'body'};var locale_opts=$.fn.datepicker.locale_opts=['format','rtl','weekStart'];$.fn.datepicker.Constructor=Datepicker;var dates=$.fn.datepicker.dates={en:{days:["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],daysShort:["Sun","Mon","Tue","Wed","Thu","Fri","Sat","Sun"],daysMin:["Su","Mo","Tu","We","Th","Fr","Sa","Su"],months:["January","February","March","April","May","June","July","August","September","October","November","December"],monthsShort:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],today:"Today",clear:"Clear"}};var DPGlobal={modes:[{clsName:'days',navFnc:'Month',navStep:1},{clsName:'months',navFnc:'FullYear',navStep:1},{clsName:'years',navFnc:'FullYear',navStep:10}],isLeapYear:function(year){return(((year%4===0)&&(year%100!==0))||(year%400===0));},getDaysInMonth:function(year,month){return[31,(DPGlobal.isLeapYear(year)?29:28),31,30,31,30,31,31,30,31,30,31][month];},validParts:/dd?|DD?|mm?|MM?|yy(?:yy)?/g,nonpunctuation:/[^ -\/:-@\[\u3400-\u9fff-`{-~\t\n\r]+/g,parseFormat:function(format){var separators=format.replace(this.validParts,'\0').split('\0'),parts=format.match(this.validParts);if(!separators||!separators.length||!parts||parts.length===0){throw new Error("Invalid date format.");}
return{separators:separators,parts:parts};},parseDate:function(date,format,language){if(!date)
return undefined;if(date instanceof Date)
return date;if(typeof format==='string')
format=DPGlobal.parseFormat(format);var part_re=/([\-+]\d+)([dmwy])/,parts=date.match(/([\-+]\d+)([dmwy])/g),part,dir,i;if(/^[\-+]\d+[dmwy]([\s,]+[\-+]\d+[dmwy])*$/.test(date)){date=new Date();for(i=0;i<parts.length;i++){part=part_re.exec(parts[i]);dir=parseInt(part[1]);switch(part[2]){case'd':date.setUTCDate(date.getUTCDate()+ dir);break;case'm':date=Datepicker.prototype.moveMonth.call(Datepicker.prototype,date,dir);break;case'w':date.setUTCDate(date.getUTCDate()+ dir*7);break;case'y':date=Datepicker.prototype.moveYear.call(Datepicker.prototype,date,dir);break;}}
return UTCDate(date.getUTCFullYear(),date.getUTCMonth(),date.getUTCDate(),0,0,0);}
parts=date&&date.match(this.nonpunctuation)||[];date=new Date();var parsed={},setters_order=['yyyy','yy','M','MM','m','mm','d','dd'],setters_map={yyyy:function(d,v){return d.setUTCFullYear(v);},yy:function(d,v){return d.setUTCFullYear(2000+v);},m:function(d,v){if(isNaN(d))
return d;v-=1;while(v<0)v+=12;v%=12;d.setUTCMonth(v);while(d.getUTCMonth()!==v)
d.setUTCDate(d.getUTCDate()-1);return d;},d:function(d,v){return d.setUTCDate(v);}},val,filtered;setters_map['M']=setters_map['MM']=setters_map['mm']=setters_map['m'];setters_map['dd']=setters_map['d'];date=UTCDate(date.getFullYear(),date.getMonth(),date.getDate(),0,0,0);var fparts=format.parts.slice();if(parts.length!==fparts.length){fparts=$(fparts).filter(function(i,p){return $.inArray(p,setters_order)!==-1;}).toArray();}
function match_part(){var m=this.slice(0,parts[i].length),p=parts[i].slice(0,m.length);return m.toLowerCase()===p.toLowerCase();}
if(parts.length===fparts.length){var cnt;for(i=0,cnt=fparts.length;i<cnt;i++){val=parseInt(parts[i],10);part=fparts[i];if(isNaN(val)){switch(part){case'MM':filtered=$(dates[language].months).filter(match_part);val=$.inArray(filtered[0],dates[language].months)+ 1;break;case'M':filtered=$(dates[language].monthsShort).filter(match_part);val=$.inArray(filtered[0],dates[language].monthsShort)+ 1;break;}}
parsed[part]=val;}
var _date,s;for(i=0;i<setters_order.length;i++){s=setters_order[i];if(s in parsed&&!isNaN(parsed[s])){_date=new Date(date);setters_map[s](_date,parsed[s]);if(!isNaN(_date))
date=_date;}}}
return date;},formatDate:function(date,format,language){if(!date)
return'';if(typeof format==='string')
format=DPGlobal.parseFormat(format);var val={d:date.getUTCDate(),D:dates[language].daysShort[date.getUTCDay()],DD:dates[language].days[date.getUTCDay()],m:date.getUTCMonth()+ 1,M:dates[language].monthsShort[date.getUTCMonth()],MM:dates[language].months[date.getUTCMonth()],yy:date.getUTCFullYear().toString().substring(2),yyyy:date.getUTCFullYear()};val.dd=(val.d<10?'0':'')+ val.d;val.mm=(val.m<10?'0':'')+ val.m;date=[];var seps=$.extend([],format.separators);for(var i=0,cnt=format.parts.length;i<=cnt;i++){if(seps.length)
date.push(seps.shift());date.push(val[format.parts[i]]);}
return date.join('');},headTemplate:'<thead>'+'<tr>'+'<th class="prev">&#171;</th>'+'<th colspan="5" class="datepicker-switch"></th>'+'<th class="next">&#187;</th>'+'</tr>'+'</thead>',contTemplate:'<tbody><tr><td colspan="7"></td></tr></tbody>',footTemplate:'<tfoot>'+'<tr>'+'<th colspan="7" class="today"></th>'+'</tr>'+'<tr>'+'<th colspan="7" class="clear"></th>'+'</tr>'+'</tfoot>'};DPGlobal.template='<div class="datepicker">'+'<div class="datepicker-days">'+'<table class=" table-condensed">'+
DPGlobal.headTemplate+'<tbody></tbody>'+
DPGlobal.footTemplate+'</table>'+'</div>'+'<div class="datepicker-months">'+'<table class="table-condensed">'+
DPGlobal.headTemplate+
DPGlobal.contTemplate+
DPGlobal.footTemplate+'</table>'+'</div>'+'<div class="datepicker-years">'+'<table class="table-condensed">'+
DPGlobal.headTemplate+
DPGlobal.contTemplate+
DPGlobal.footTemplate+'</table>'+'</div>'+'</div>';$.fn.datepicker.DPGlobal=DPGlobal;$.fn.datepicker.noConflict=function(){$.fn.datepicker=old;return this;};$.fn.datepicker.version="1.4.0";$(document).on('focus.datepicker.data-api click.datepicker.data-api','[data-provide="datepicker"]',function(e){var $this=$(this);if($this.data('datepicker'))
return;e.preventDefault();datepickerPlugin.call($this,'show');});$(function(){datepickerPlugin.call($('[data-provide="datepicker-inline"]'));});}(window.jQuery));
/*!
 * Bootstrap-select v1.7.2 (http://silviomoreto.github.io/bootstrap-select)
 *
 * Copyright 2013-2015 bootstrap-select
 * Licensed under MIT (https://github.com/silviomoreto/bootstrap-select/blob/master/LICENSE)
 */


(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    // AMD. Register as an anonymous module unless amdModuleId is set
    define(["jquery"], function (a0) {
      return (factory(a0));
    });
  } else if (typeof exports === 'object') {
    // Node. Does not work with strict CommonJS, but
    // only CommonJS-like environments that support module.exports,
    // like Node.
    module.exports = factory(require("jquery"));
  } else {
    factory(jQuery);
  }
}(this, function () {

(function ($) {
  'use strict';

  //<editor-fold desc="Shims">
  if (!String.prototype.includes) {
    (function () {
      'use strict'; // needed to support `apply`/`call` with `undefined`/`null`
      var toString = {}.toString;
      var defineProperty = (function () {
        // IE 8 only supports `Object.defineProperty` on DOM elements
        try {
          var object = {};
          var $defineProperty = Object.defineProperty;
          var result = $defineProperty(object, object, object) && $defineProperty;
        } catch (error) {
        }
        return result;
      }());
      var indexOf = ''.indexOf;
      var includes = function (search) {
        if (this == null) {
          throw TypeError();
        }
        var string = String(this);
        if (search && toString.call(search) == '[object RegExp]') {
          throw TypeError();
        }
        var stringLength = string.length;
        var searchString = String(search);
        var searchLength = searchString.length;
        var position = arguments.length > 1 ? arguments[1] : undefined;
        // `ToInteger`
        var pos = position ? Number(position) : 0;
        if (pos != pos) { // better `isNaN`
          pos = 0;
        }
        var start = Math.min(Math.max(pos, 0), stringLength);
        // Avoid the `indexOf` call if no match is possible
        if (searchLength + start > stringLength) {
          return false;
        }
        return indexOf.call(string, searchString, pos) != -1;
      };
      if (defineProperty) {
        defineProperty(String.prototype, 'includes', {
          'value': includes,
          'configurable': true,
          'writable': true
        });
      } else {
        String.prototype.includes = includes;
      }
    }());
  }

  if (!String.prototype.startsWith) {
    (function () {
      'use strict'; // needed to support `apply`/`call` with `undefined`/`null`
      var defineProperty = (function () {
        // IE 8 only supports `Object.defineProperty` on DOM elements
        try {
          var object = {};
          var $defineProperty = Object.defineProperty;
          var result = $defineProperty(object, object, object) && $defineProperty;
        } catch (error) {
        }
        return result;
      }());
      var toString = {}.toString;
      var startsWith = function (search) {
        if (this == null) {
          throw TypeError();
        }
        var string = String(this);
        if (search && toString.call(search) == '[object RegExp]') {
          throw TypeError();
        }
        var stringLength = string.length;
        var searchString = String(search);
        var searchLength = searchString.length;
        var position = arguments.length > 1 ? arguments[1] : undefined;
        // `ToInteger`
        var pos = position ? Number(position) : 0;
        if (pos != pos) { // better `isNaN`
          pos = 0;
        }
        var start = Math.min(Math.max(pos, 0), stringLength);
        // Avoid the `indexOf` call if no match is possible
        if (searchLength + start > stringLength) {
          return false;
        }
        var index = -1;
        while (++index < searchLength) {
          if (string.charCodeAt(start + index) != searchString.charCodeAt(index)) {
            return false;
          }
        }
        return true;
      };
      if (defineProperty) {
        defineProperty(String.prototype, 'startsWith', {
          'value': startsWith,
          'configurable': true,
          'writable': true
        });
      } else {
        String.prototype.startsWith = startsWith;
      }
    }());
  }

  if (!Object.keys) {
    Object.keys = function (
      o, // object
      k, // key
      r  // result array
      ){
      // initialize object and result
      r=[];
      // iterate over object keys
      for (k in o)
          // fill result array with non-prototypical keys
        r.hasOwnProperty.call(o, k) && r.push(k);
      // return result
      return r
    };
  }
  //</editor-fold>

  // Case insensitive contains search
  $.expr[':'].icontains = function (obj, index, meta) {
    var $obj = $(obj);
    var haystack = ($obj.data('tokens') || $obj.text()).toUpperCase();
    return haystack.includes(meta[3].toUpperCase());
  };

  // Case insensitive begins search
  $.expr[':'].ibegins = function (obj, index, meta) {
    var $obj = $(obj);
    var haystack = ($obj.data('tokens') || $obj.text()).toUpperCase();
    return haystack.startsWith(meta[3].toUpperCase());
  };

  // Case and accent insensitive contains search
  $.expr[':'].aicontains = function (obj, index, meta) {
    var $obj = $(obj);
    var haystack = ($obj.data('tokens') || $obj.data('normalizedText') || $obj.text()).toUpperCase();
    return haystack.includes(meta[3].toUpperCase());
  };

  // Case and accent insensitive begins search
  $.expr[':'].aibegins = function (obj, index, meta) {
    var $obj = $(obj);
    var haystack = ($obj.data('tokens') || $obj.data('normalizedText') || $obj.text()).toUpperCase();
    return haystack.startsWith(meta[3].toUpperCase());
  };

  /**
   * Remove all diatrics from the given text.
   * @access private
   * @param {String} text
   * @returns {String}
   */
  function normalizeToBase(text) {
    var rExps = [
      {re: /[\xC0-\xC6]/g, ch: "A"},
      {re: /[\xE0-\xE6]/g, ch: "a"},
      {re: /[\xC8-\xCB]/g, ch: "E"},
      {re: /[\xE8-\xEB]/g, ch: "e"},
      {re: /[\xCC-\xCF]/g, ch: "I"},
      {re: /[\xEC-\xEF]/g, ch: "i"},
      {re: /[\xD2-\xD6]/g, ch: "O"},
      {re: /[\xF2-\xF6]/g, ch: "o"},
      {re: /[\xD9-\xDC]/g, ch: "U"},
      {re: /[\xF9-\xFC]/g, ch: "u"},
      {re: /[\xC7-\xE7]/g, ch: "c"},
      {re: /[\xD1]/g, ch: "N"},
      {re: /[\xF1]/g, ch: "n"}
    ];
    $.each(rExps, function () {
      text = text.replace(this.re, this.ch);
    });
    return text;
  }


  function htmlEscape(html) {
    var escapeMap = {
      '&': '&amp;',
      '<': '&lt;',
      '>': '&gt;',
      '"': '&quot;',
      "'": '&#x27;',
      '`': '&#x60;'
    };
    var source = '(?:' + Object.keys(escapeMap).join('|') + ')',
        testRegexp = new RegExp(source),
        replaceRegexp = new RegExp(source, 'g'),
        string = html == null ? '' : '' + html;
    return testRegexp.test(string) ? string.replace(replaceRegexp, function (match) {
      return escapeMap[match];
    }) : string;
  }

  var Selectpicker = function (element, options, e) {
    if (e) {
      e.stopPropagation();
      e.preventDefault();
    }

    this.$element = $(element);
    this.$newElement = null;
    this.$button = null;
    this.$menu = null;
    this.$lis = null;
    this.options = options;

    // If we have no title yet, try to pull it from the html title attribute (jQuery doesnt' pick it up as it's not a
    // data-attribute)
    if (this.options.title === null) {
      this.options.title = this.$element.attr('title');
    }

    //Expose public methods
    this.val = Selectpicker.prototype.val;
    this.render = Selectpicker.prototype.render;
    this.refresh = Selectpicker.prototype.refresh;
    this.setStyle = Selectpicker.prototype.setStyle;
    this.selectAll = Selectpicker.prototype.selectAll;
    this.deselectAll = Selectpicker.prototype.deselectAll;
    this.destroy = Selectpicker.prototype.remove;
    this.remove = Selectpicker.prototype.remove;
    this.show = Selectpicker.prototype.show;
    this.hide = Selectpicker.prototype.hide;

    this.init();
  };

  Selectpicker.VERSION = '1.7.2';

  // part of this is duplicated in i18n/defaults-en_US.js. Make sure to update both.
  Selectpicker.DEFAULTS = {
    noneSelectedText: 'Nothing selected',
    noneResultsText: 'No results matched {0}',
    countSelectedText: function (numSelected, numTotal) {
      return (numSelected == 1) ? "{0} item selected" : "{0} items selected";
    },
    maxOptionsText: function (numAll, numGroup) {
      return [
        (numAll == 1) ? 'Limit reached ({n} item max)' : 'Limit reached ({n} items max)',
        (numGroup == 1) ? 'Group limit reached ({n} item max)' : 'Group limit reached ({n} items max)'
      ];
    },
    selectAllText: 'Select All',
    deselectAllText: 'Deselect All',
    doneButton: false,
    doneButtonText: 'Close',
    multipleSeparator: ', ',
    styleBase: 'btn',
    style: 'btn-default',
    size: 'auto',
    title: null,
    selectedTextFormat: 'values',
    width: false,
    container: false,
    hideDisabled: false,
    showSubtext: false,
    showIcon: true,
    showContent: true,
    dropupAuto: true,
    header: false,
    liveSearch: false,
    liveSearchPlaceholder: null,
    liveSearchNormalize: false,
    liveSearchStyle: 'contains',
    actionsBox: false,
    iconBase: 'maxicons',
    tickIcon: 'icon-maxicons1-check',
    maxOptions: false,
    mobile: true,
    selectOnTab: false,
    dropdownAlignRight: false
  };

  Selectpicker.prototype = {

    constructor: Selectpicker,

    init: function () {
      var that = this,
          id = this.$element.attr('id');

      this.$element.addClass('bs-select-hidden');
      // store originalIndex (key) and newIndex (value) in this.liObj for fast accessibility
      // allows us to do this.$lis.eq(that.liObj[index]) instead of this.$lis.filter('[data-original-index="' + index + '"]')
      this.liObj = {};
      this.multiple = this.$element.prop('multiple');
      this.autofocus = this.$element.prop('autofocus');
      this.$newElement = this.createView();
      this.$element.after(this.$newElement);
      this.$button = this.$newElement.children('button');
      this.$menu = this.$newElement.children('.dropdown-menu');
      this.$menuInner = this.$menu.children('.inner');
      this.$searchbox = this.$menu.find('input');

      if (this.options.dropdownAlignRight)
        this.$menu.addClass('dropdown-menu-right');

      if (typeof id !== 'undefined') {
        this.$button.attr('data-id', id);
        $('label[for="' + id + '"]').click(function (e) {
          e.preventDefault();
          that.$button.focus();
        });
      }

      this.checkDisabled();
      this.clickListener();
      if (this.options.liveSearch) this.liveSearchListener();
      this.render();
      this.setStyle();
      this.setWidth();
      if (this.options.container) this.selectPosition();
      this.$menu.data('this', this);
      this.$newElement.data('this', this);
      if (this.options.mobile) this.mobile();

      this.$newElement.on('hide.bs.dropdown', function (e) {
        that.$element.trigger('hide.bs.select', e);
      });

      this.$newElement.on('hidden.bs.dropdown', function (e) {
        that.$element.trigger('hidden.bs.select', e);
      });

      this.$newElement.on('show.bs.dropdown', function (e) {
        that.$element.trigger('show.bs.select', e);
      });

      this.$newElement.on('shown.bs.dropdown', function (e) {
        that.$element.trigger('shown.bs.select', e);
      });

      setTimeout(function () {
        that.$element.trigger('loaded.bs.select');
      });
    },

    createDropdown: function () {
      // Options
      // If we are multiple, then add the show-tick class by default
      var multiple = this.multiple ? ' show-tick' : '',
          inputGroup = this.$element.parent().hasClass('input-group') ? ' input-group-btn' : '',
          autofocus = this.autofocus ? ' autofocus' : '';
      // Elements
      var header = this.options.header ? '<div class="popover-title"><button type="button" class="close" aria-hidden="true">&times;</button>' + this.options.header + '</div>' : '';
      var searchbox = this.options.liveSearch ?
      '<div class="bs-searchbox">' +
      '<input type="text" class="form-control" autocomplete="off"' +
      (null === this.options.liveSearchPlaceholder ? '' : ' placeholder="' + htmlEscape(this.options.liveSearchPlaceholder) + '"') + '>' +
      '</div>'
          : '';
      var actionsbox = this.multiple && this.options.actionsBox ?
      '<div class="bs-actionsbox">' +
      '<div class="btn-group btn-group-sm btn-block">' +
      '<button type="button" class="actions-btn bs-select-all btn btn-success">' +
      this.options.selectAllText +
      '</button>' +
      '<button type="button" class="actions-btn bs-deselect-all btn btn-danger">' +
      this.options.deselectAllText +
      '</button>' +
      '</div>' +
      '</div>'
          : '';
      var donebutton = this.multiple && this.options.doneButton ?
      '<div class="bs-donebutton">' +
      '<div class="btn-group btn-block">' +
      '<button type="button" class="btn btn-sm btn-default">' +
      this.options.doneButtonText +
      '</button>' +
      '</div>' +
      '</div>'
          : '';
      var drop =
          '<div class="btn-group bootstrap-select' + multiple + inputGroup + '">' +
          '<button type="button" class="' + this.options.styleBase + ' dropdown-toggle" data-toggle="dropdown"' + autofocus + '>' +
          '<span class="filter-option pull-left"></span>&nbsp;' +
          '<i class="icon-maxicons1-down f10"></i>' +
          '</button>' +
          '<div class="dropdown-menu open">' +
          header +
          searchbox +
          actionsbox +
          '<ul class="dropdown-menu inner" role="menu">' +
          '</ul>' +
          donebutton +
          '</div>' +
          '</div>';

      return $(drop);
    },

    createView: function () {
      var $drop = this.createDropdown(),
          li = this.createLi();

      $drop.find('ul')[0].innerHTML = li;
      return $drop;
    },

    reloadLi: function () {
      //Remove all children.
      this.destroyLi();
      //Re build
      var li = this.createLi();
      this.$menuInner[0].innerHTML = li;
    },

    destroyLi: function () {
      this.$menu.find('li').remove();
    },

    createLi: function () {
      var that = this,
          _li = [],
          optID = 0,
          titleOption = document.createElement('option'),
          liIndex = -1; // increment liIndex whenever a new <li> element is created to ensure liObj is correct

      // Helper functions
      /**
       * @param content
       * @param [index]
       * @param [classes]
       * @param [optgroup]
       * @returns {string}
       */
      var generateLI = function (content, index, classes, optgroup) {
        return '<li' +
            ((typeof classes !== 'undefined' & '' !== classes) ? ' class="' + classes + '"' : '') +
            ((typeof index !== 'undefined' & null !== index) ? ' data-original-index="' + index + '"' : '') +
            ((typeof optgroup !== 'undefined' & null !== optgroup) ? 'data-optgroup="' + optgroup + '"' : '') +
            '>' + content + '</li>';
      };

      /**
       * @param text
       * @param [classes]
       * @param [inline]
       * @param [tokens]
       * @returns {string}
       */
      var generateA = function (text, classes, inline, tokens) {
        return '<a tabindex="0"' +
            (typeof classes !== 'undefined' ? ' class="' + classes + '"' : '') +
            (typeof inline !== 'undefined' ? ' style="' + inline + '"' : '') +
            (that.options.liveSearchNormalize ? ' data-normalized-text="' + normalizeToBase(htmlEscape(text)) + '"' : '') +
            (typeof tokens !== 'undefined' || tokens !== null ? ' data-tokens="' + tokens + '"' : '') +
            '>' + text +
            '<span class="' + that.options.iconBase + ' ' + that.options.tickIcon + ' check-mark"></span>' +
            '</a>';
      };

      if (this.options.title && !this.multiple) {
        // this option doesn't create a new <li> element, but does add a new option, so liIndex is decreased
        // since liObj is recalculated on every refresh, liIndex needs to be decreased even if the titleOption is already appended
        liIndex--;

        if (!this.$element.find('.bs-title-option').length) {
          // Use native JS to prepend option (faster)
          var element = this.$element[0];
          titleOption.className = 'bs-title-option';
          titleOption.appendChild(document.createTextNode(this.options.title));
          titleOption.value = '';
          element.insertBefore(titleOption, element.firstChild);
          // Check if selected attribute is already set on an option. If not, select the titleOption option.
          if (element.options[element.selectedIndex].getAttribute('selected') === null) titleOption.selected = true;
        }
      }

      this.$element.find('option').each(function (index) {
        var $this = $(this);

        liIndex++;

        if ($this.hasClass('bs-title-option')) return;

        // Get the class and text for the option
        var optionClass = this.className || '',
            inline = this.style.cssText,
            text = $this.data('content') ? $this.data('content') : $this.html(),
            tokens = $this.data('tokens') ? $this.data('tokens') : null,
            subtext = typeof $this.data('subtext') !== 'undefined' ? '<small class="text-muted">' + $this.data('subtext') + '</small>' : '',
            icon = typeof $this.data('icon') !== 'undefined' ? '<span class="' + that.options.iconBase + ' ' + $this.data('icon') + '"></span> ' : '',
            isDisabled = this.disabled || this.parentElement.tagName === 'OPTGROUP' && this.parentElement.disabled;

        if (icon !== '' && isDisabled) {
          icon = '<span>' + icon + '</span>';
        }

        if (that.options.hideDisabled && isDisabled) {
          liIndex--;
          return;
        }

        if (!$this.data('content')) {
          // Prepend any icon and append any subtext to the main text.
          text = icon + '<span class="text">' + text + subtext + '</span>';
        }

        if (this.parentElement.tagName === 'OPTGROUP' && $this.data('divider') !== true) {
          if ($this.index() === 0) { // Is it the first option of the optgroup?
            optID += 1;

            // Get the opt group label
            var label = this.parentElement.label,
                labelSubtext = typeof $this.parent().data('subtext') !== 'undefined' ? '<small class="text-muted">' + $this.parent().data('subtext') + '</small>' : '',
                labelIcon = $this.parent().data('icon') ? '<span class="' + that.options.iconBase + ' ' + $this.parent().data('icon') + '"></span> ' : '',
                optGroupClass = ' ' + this.parentElement.className || '';

            label = labelIcon + '<span class="text">' + label + labelSubtext + '</span>';

            if (index !== 0 && _li.length > 0) { // Is it NOT the first option of the select && are there elements in the dropdown?
              liIndex++;
              _li.push(generateLI('', null, 'divider', optID + 'div'));
            }
            liIndex++;
            _li.push(generateLI(label, null, 'dropdown-header' + optGroupClass, optID));
          }
          _li.push(generateLI(generateA(text, 'opt ' + optionClass + optGroupClass, inline, tokens), index, '', optID));
        } else if ($this.data('divider') === true) {
          _li.push(generateLI('', index, 'divider'));
        } else if ($this.data('hidden') === true) {
          _li.push(generateLI(generateA(text, optionClass, inline, tokens), index, 'hidden is-hidden'));
        } else {
          if (this.previousElementSibling && this.previousElementSibling.tagName === 'OPTGROUP') {
            liIndex++;
            _li.push(generateLI('', null, 'divider', optID + 'div'));
          }
          _li.push(generateLI(generateA(text, optionClass, inline, tokens), index));
        }

        that.liObj[index] = liIndex;
      });

      //If we are not multiple, we don't have a selected item, and we don't have a title, select the first element so something is set in the button
      if (!this.multiple && this.$element.find('option:selected').length === 0 && !this.options.title) {
        this.$element.find('option').eq(0).prop('selected', true).attr('selected', 'selected');
      }

      return _li.join('');
    },

    findLis: function () {
      if (this.$lis == null) this.$lis = this.$menu.find('li');
      return this.$lis;
    },

    /**
     * @param [updateLi] defaults to true
     */
    render: function (updateLi) {
      var that = this,
          notDisabled;

      //Update the LI to match the SELECT
      if (updateLi !== false) {
        this.$element.find('option').each(function (index) {
          var $lis = that.findLis().eq(that.liObj[index]);

          that.setDisabled(index, this.disabled || this.parentElement.tagName === 'OPTGROUP' && this.parentElement.disabled, $lis);
          that.setSelected(index, this.selected, $lis);
        });
      }

      this.tabIndex();

      var selectedItems = this.$element.find('option').map(function () {
        if (this.selected) {
          if (that.options.hideDisabled && (this.disabled || this.parentElement.tagName === 'OPTGROUP' && this.parentElement.disabled)) return false;

          var $this = $(this),
              icon = $this.data('icon') && that.options.showIcon ? '<i class="' + that.options.iconBase + ' ' + $this.data('icon') + '"></i> ' : '',
              subtext;

          if (that.options.showSubtext && $this.data('subtext') && !that.multiple) {
            subtext = ' <small class="text-muted">' + $this.data('subtext') + '</small>';
          } else {
            subtext = '';
          }
          if (typeof $this.attr('title') !== 'undefined') {
            return $this.attr('title');
          } else if ($this.data('content') && that.options.showContent) {
            return $this.data('content');
          } else {
            return icon + $this.html() + subtext;
          }
        }
      }).toArray();

      //Fixes issue in IE10 occurring when no default option is selected and at least one option is disabled
      //Convert all the values into a comma delimited string
      var title = !this.multiple ? selectedItems[0] : selectedItems.join(this.options.multipleSeparator);

      //If this is multi select, and the selectText type is count, the show 1 of 2 selected etc..
      if (this.multiple && this.options.selectedTextFormat.indexOf('count') > -1) {
        var max = this.options.selectedTextFormat.split('>');
        if ((max.length > 1 && selectedItems.length > max[1]) || (max.length == 1 && selectedItems.length >= 2)) {
          notDisabled = this.options.hideDisabled ? ', [disabled]' : '';
          var totalCount = this.$element.find('option').not('[data-divider="true"], [data-hidden="true"]' + notDisabled).length,
              tr8nText = (typeof this.options.countSelectedText === 'function') ? this.options.countSelectedText(selectedItems.length, totalCount) : this.options.countSelectedText;
          title = tr8nText.replace('{0}', selectedItems.length.toString()).replace('{1}', totalCount.toString());
        }
      }

      if (this.options.title == undefined) {
        this.options.title = this.$element.attr('title');
      }

      if (this.options.selectedTextFormat == 'static') {
        title = this.options.title;
      }

      //If we dont have a title, then use the default, or if nothing is set at all, use the not selected text
      if (!title) {
        title = typeof this.options.title !== 'undefined' ? this.options.title : this.options.noneSelectedText;
      }

      //strip all html-tags and trim the result
      this.$button.attr('title', $.trim(title.replace(/<[^>]*>?/g, '')));
      this.$button.children('.filter-option').html(title);

      this.$element.trigger('rendered.bs.select');
    },

    /**
     * @param [style]
     * @param [status]
     */
    setStyle: function (style, status) {
      if (this.$element.attr('class')) {
        this.$newElement.addClass(this.$element.attr('class').replace(/selectpicker|mobile-device|bs-select-hidden|validate\[.*\]/gi, ''));
      }

      var buttonClass = style ? style : this.options.style;

      if (status == 'add') {
        this.$button.addClass(buttonClass);
      } else if (status == 'remove') {
        this.$button.removeClass(buttonClass);
      } else {
        this.$button.removeClass(this.options.style);
        this.$button.addClass(buttonClass);
      }
    },

    liHeight: function (refresh) {
      if (!refresh && (this.options.size === false || this.sizeInfo)) return;

      var newElement = document.createElement('div'),
          menu = document.createElement('div'),
          menuInner = document.createElement('ul'),
          divider = document.createElement('li'),
          li = document.createElement('li'),
          a = document.createElement('a'),
          text = document.createElement('span'),
          header = this.options.header ? this.$menu.find('.popover-title')[0].cloneNode(true) : null,
          search = this.options.liveSearch ? document.createElement('div') : null,
          actions = this.options.actionsBox && this.multiple ? this.$menu.find('.bs-actionsbox')[0].cloneNode(true) : null,
          doneButton = this.options.doneButton && this.multiple ? this.$menu.find('.bs-donebutton')[0].cloneNode(true) : null;

      text.className = 'text';
      newElement.className = this.$menu[0].parentNode.className + ' open';
      menu.className = 'dropdown-menu open';
      menuInner.className = 'dropdown-menu inner';
      divider.className = 'divider';

      text.appendChild(document.createTextNode('Inner text'));
      a.appendChild(text);
      li.appendChild(a);
      menuInner.appendChild(li);
      menuInner.appendChild(divider);
      if (header) menu.appendChild(header);
      if (search) {
        // create a span instead of input as creating an input element is slower
        var input = document.createElement('span');
        search.className = 'bs-searchbox';
        input.className = 'form-control';
        search.appendChild(input);
        menu.appendChild(search);
      }
      if (actions) menu.appendChild(actions);
      menu.appendChild(menuInner);
      if (doneButton) menu.appendChild(doneButton);
      newElement.appendChild(menu);

      document.body.appendChild(newElement);

      var liHeight = a.offsetHeight,
          headerHeight = header ? header.offsetHeight : 0,
          searchHeight = search ? search.offsetHeight : 0,
          actionsHeight = actions ? actions.offsetHeight : 0,
          doneButtonHeight = doneButton ? doneButton.offsetHeight : 0,
          dividerHeight = $(divider).outerHeight(true),
          // fall back to jQuery if getComputedStyle is not supported
          menuStyle = getComputedStyle ? getComputedStyle(menu) : false,
          $menu = menuStyle ? $(menu) : null,
          menuPadding = parseInt(menuStyle ? menuStyle.paddingTop : $menu.css('paddingTop')) +
                        parseInt(menuStyle ? menuStyle.paddingBottom : $menu.css('paddingBottom')) +
                        parseInt(menuStyle ? menuStyle.borderTopWidth : $menu.css('borderTopWidth')) +
                        parseInt(menuStyle ? menuStyle.borderBottomWidth : $menu.css('borderBottomWidth')),
          menuExtras =  menuPadding +
                        parseInt(menuStyle ? menuStyle.marginTop : $menu.css('marginTop')) +
                        parseInt(menuStyle ? menuStyle.marginBottom : $menu.css('marginBottom')) + 2;

      document.body.removeChild(newElement);

      this.sizeInfo = {
        liHeight: liHeight,
        headerHeight: headerHeight,
        searchHeight: searchHeight,
        actionsHeight: actionsHeight,
        doneButtonHeight: doneButtonHeight,
        dividerHeight: dividerHeight,
        menuPadding: menuPadding,
        menuExtras: menuExtras
      };
    },

    setSize: function () {
      this.findLis();
      this.liHeight();
      var that = this,
          $menu = this.$menu,
          $menuInner = this.$menuInner,
          $window = $(window),
          selectHeight = this.$newElement[0].offsetHeight,
          liHeight = this.sizeInfo['liHeight'],
          headerHeight = this.sizeInfo['headerHeight'],
          searchHeight = this.sizeInfo['searchHeight'],
          actionsHeight = this.sizeInfo['actionsHeight'],
          doneButtonHeight = this.sizeInfo['doneButtonHeight'],
          divHeight = this.sizeInfo['dividerHeight'],
          menuPadding = this.sizeInfo['menuPadding'],
          menuExtras = this.sizeInfo['menuExtras'],
          notDisabled = this.options.hideDisabled ? '.disabled' : '',
          menuHeight,
          getHeight,
          selectOffsetTop,
          selectOffsetBot,
          posVert = function () {
            selectOffsetTop = that.$newElement.offset().top - $window.scrollTop();
            selectOffsetBot = $window.height() - selectOffsetTop - selectHeight;
          };

      posVert();

      if (this.options.header) $menu.css('padding-top', 0);

      if (this.options.size === 'auto') {
        var getSize = function () {
          var minHeight,
              hasClass = function (className, include) {
                return function (element) {
                    if (include) {
                        return (element.classList ? element.classList.contains(className) : $(element).hasClass(className));
                    } else {
                        return !(element.classList ? element.classList.contains(className) : $(element).hasClass(className));
                    }
                };
              },
              lis = that.$menuInner[0].getElementsByTagName('li'),
              lisVisible = Array.prototype.filter ? Array.prototype.filter.call(lis, hasClass('hidden', false)) : that.$lis.not('.hidden'),
              optGroup = Array.prototype.filter ? Array.prototype.filter.call(lisVisible, hasClass('dropdown-header', true)) : lisVisible.filter('.dropdown-header');

          posVert();
          menuHeight = selectOffsetBot - menuExtras;

          if (that.options.container) {
            if (!$menu.data('height')) $menu.data('height', $menu.height());
            getHeight = $menu.data('height');
          } else {
            getHeight = $menu.height();
          }

          if (that.options.dropupAuto) {
            that.$newElement.toggleClass('dropup', selectOffsetTop > selectOffsetBot && (menuHeight - menuExtras) < getHeight);
          }
          if (that.$newElement.hasClass('dropup')) {
            menuHeight = selectOffsetTop - menuExtras;
          }

          if ((lisVisible.length + optGroup.length) > 3) {
            minHeight = liHeight * 3 + menuExtras - 2;
          } else {
            minHeight = 0;
          }

          $menu.css({
            'max-height': menuHeight + 'px',
            'overflow': 'hidden',
            'min-height': minHeight + headerHeight + searchHeight + actionsHeight + doneButtonHeight + 'px'
          });
          $menuInner.css({
            'max-height': menuHeight - headerHeight - searchHeight - actionsHeight - doneButtonHeight - menuPadding + 'px',
            'overflow-y': 'auto',
            'min-height': Math.max(minHeight - menuPadding, 0) + 'px'
          });
        };
        getSize();
        this.$searchbox.off('input.getSize propertychange.getSize').on('input.getSize propertychange.getSize', getSize);
        $window.off('resize.getSize scroll.getSize').on('resize.getSize scroll.getSize', getSize);
      } else if (this.options.size && this.options.size != 'auto' && this.$lis.not(notDisabled).length > this.options.size) {
        var optIndex = this.$lis.not('.divider').not(notDisabled).children().slice(0, this.options.size).last().parent().index(),
            divLength = this.$lis.slice(0, optIndex + 1).filter('.divider').length;
        menuHeight = liHeight * this.options.size + divLength * divHeight + menuPadding;

        if (that.options.container) {
          if (!$menu.data('height')) $menu.data('height', $menu.height());
          getHeight = $menu.data('height');
        } else {
          getHeight = $menu.height();
        }

        if (that.options.dropupAuto) {
          //noinspection JSUnusedAssignment
          this.$newElement.toggleClass('dropup', selectOffsetTop > selectOffsetBot && (menuHeight - menuExtras) < getHeight);
        }
        $menu.css({
          'max-height': menuHeight + headerHeight + searchHeight + actionsHeight + doneButtonHeight + 'px',
          'overflow': 'hidden',
          'min-height': ''
        });
        $menuInner.css({
          'max-height': menuHeight - menuPadding + 'px',
          'overflow-y': 'auto',
          'min-height': ''
        });
      }
    },

    setWidth: function () {
      if (this.options.width === 'auto') {
        this.$menu.css('min-width', '0');

        // Get correct width if element is hidden
        var $selectClone = this.$menu.parent().clone().appendTo('body'),
            $selectClone2 = this.options.container ? this.$newElement.clone().appendTo('body') : $selectClone,
            ulWidth = $selectClone.children('.dropdown-menu').outerWidth(),
            btnWidth = $selectClone2.css('width', 'auto').children('button').outerWidth();

        $selectClone.remove();
        $selectClone2.remove();

        // Set width to whatever's larger, button title or longest option
        this.$newElement.css('width', Math.max(ulWidth, btnWidth) + 'px');
      } else if (this.options.width === 'fit') {
        // Remove inline min-width so width can be changed from 'auto'
        this.$menu.css('min-width', '');
        this.$newElement.css('width', '').addClass('fit-width');
      } else if (this.options.width) {
        // Remove inline min-width so width can be changed from 'auto'
        this.$menu.css('min-width', '');
        this.$newElement.css('width', this.options.width);
      } else {
        // Remove inline min-width/width so width can be changed
        this.$menu.css('min-width', '');
        this.$newElement.css('width', '');
      }
      // Remove fit-width class if width is changed programmatically
      if (this.$newElement.hasClass('fit-width') && this.options.width !== 'fit') {
        this.$newElement.removeClass('fit-width');
      }
    },

    selectPosition: function () {
      var that = this,
          drop = '<div />',
          $drop = $(drop),
          pos,
          actualHeight,
          getPlacement = function ($element) {
            $drop.addClass($element.attr('class').replace(/form-control|fit-width/gi, '')).toggleClass('dropup', $element.hasClass('dropup'));
            pos = $element.offset();
            actualHeight = $element.hasClass('dropup') ? 0 : $element[0].offsetHeight;
            $drop.css({
              'top': pos.top + actualHeight,
              'left': pos.left,
              'width': $element[0].offsetWidth,
              'position': 'absolute'
            });
          };

      this.$newElement.on('click', function () {
        if (that.isDisabled()) {
          return;
        }
        getPlacement($(this));
        $drop.appendTo(that.options.container);
        $drop.toggleClass('open', !$(this).hasClass('open'));
        $drop.append(that.$menu);
      });

      $(window).on('resize scroll', function () {
        getPlacement(that.$newElement);
      });

      this.$element.on('hide.bs.select', function () {
        that.$menu.data('height', that.$menu.height());
        $drop.detach();
      });
    },

    setSelected: function (index, selected, $lis) {
      if (!$lis) {
        var $lis = this.findLis().eq(this.liObj[index]);
      }

      $lis.toggleClass('selected', selected);
    },

    setDisabled: function (index, disabled, $lis) {
      if (!$lis) {
        var $lis = this.findLis().eq(this.liObj[index]);
      }

      if (disabled) {
        $lis.addClass('disabled').children('a').attr('href', '#').attr('tabindex', -1);
      } else {
        $lis.removeClass('disabled').children('a').removeAttr('href').attr('tabindex', 0);
      }
    },

    isDisabled: function () {
      return this.$element[0].disabled;
    },

    checkDisabled: function () {
      var that = this;

      if (this.isDisabled()) {
        this.$newElement.addClass('disabled');
        this.$button.addClass('disabled').attr('tabindex', -1);
      } else {
        if (this.$button.hasClass('disabled')) {
          this.$newElement.removeClass('disabled');
          this.$button.removeClass('disabled');
        }

        if (this.$button.attr('tabindex') == -1 && !this.$element.data('tabindex')) {
          this.$button.removeAttr('tabindex');
        }
      }

      this.$button.click(function () {
        return !that.isDisabled();
      });
    },

    tabIndex: function () {
      if (this.$element.is('[tabindex]')) {
        this.$element.data('tabindex', this.$element.attr('tabindex'));
        this.$button.attr('tabindex', this.$element.data('tabindex'));
      }
    },

    clickListener: function () {
      var that = this,
          $document = $(document);

      this.$newElement.on('touchstart.dropdown', '.dropdown-menu', function (e) {
        e.stopPropagation();
      });

      $document.data('spaceSelect', false);

      this.$button.on('keyup', function (e) {
        if (/(32)/.test(e.keyCode.toString(10)) && $document.data('spaceSelect')) {
            e.preventDefault();
            $document.data('spaceSelect', false);
        }
      });

      this.$newElement.on('click', function () {
        that.setSize();
        that.$element.on('shown.bs.select', function () {
          if (!that.options.liveSearch && !that.multiple) {
            that.$menu.find('.selected a').focus();
          } else if (!that.multiple) {
            var selectedIndex = that.liObj[that.$element[0].selectedIndex];

            if (typeof selectedIndex !== 'number') return;

            // scroll to selected option
            var offset = that.$lis.eq(selectedIndex)[0].offsetTop - that.$menuInner[0].offsetTop;
            offset = offset - that.$menuInner[0].offsetHeight/2 + that.sizeInfo.liHeight/2;
            that.$menuInner[0].scrollTop = offset;
          }
        });
      });

      this.$menu.on('click', 'li a', function (e) {
        var $this = $(this),
            clickedIndex = $this.parent().data('originalIndex'),
            prevValue = that.$element.val(),
            prevIndex = that.$element.prop('selectedIndex');

        // Don't close on multi choice menu
        if (that.multiple) {
          e.stopPropagation();
        }

        e.preventDefault();

        //Don't run if we have been disabled
        if (!that.isDisabled() && !$this.parent().hasClass('disabled')) {
          var $options = that.$element.find('option'),
              $option = $options.eq(clickedIndex),
              state = $option.prop('selected'),
              $optgroup = $option.parent('optgroup'),
              maxOptions = that.options.maxOptions,
              maxOptionsGrp = $optgroup.data('maxOptions') || false;

          if (!that.multiple) { // Deselect all others if not multi select box
            $options.prop('selected', false);
            $option.prop('selected', true);
            that.$menu.find('.selected').removeClass('selected');
            that.setSelected(clickedIndex, true);
          } else { // Toggle the one we have chosen if we are multi select.
            $option.prop('selected', !state);
            that.setSelected(clickedIndex, !state);
            $this.blur();

            if (maxOptions !== false || maxOptionsGrp !== false) {
              var maxReached = maxOptions < $options.filter(':selected').length,
                  maxReachedGrp = maxOptionsGrp < $optgroup.find('option:selected').length;

              if ((maxOptions && maxReached) || (maxOptionsGrp && maxReachedGrp)) {
                if (maxOptions && maxOptions == 1) {
                  $options.prop('selected', false);
                  $option.prop('selected', true);
                  that.$menu.find('.selected').removeClass('selected');
                  that.setSelected(clickedIndex, true);
                } else if (maxOptionsGrp && maxOptionsGrp == 1) {
                  $optgroup.find('option:selected').prop('selected', false);
                  $option.prop('selected', true);
                  var optgroupID = $this.parent().data('optgroup');
                  that.$menu.find('[data-optgroup="' + optgroupID + '"]').removeClass('selected');
                  that.setSelected(clickedIndex, true);
                } else {
                  var maxOptionsArr = (typeof that.options.maxOptionsText === 'function') ?
                          that.options.maxOptionsText(maxOptions, maxOptionsGrp) : that.options.maxOptionsText,
                      maxTxt = maxOptionsArr[0].replace('{n}', maxOptions),
                      maxTxtGrp = maxOptionsArr[1].replace('{n}', maxOptionsGrp),
                      $notify = $('<div class="notify"></div>');
                  // If {var} is set in array, replace it
                  /** @deprecated */
                  if (maxOptionsArr[2]) {
                    maxTxt = maxTxt.replace('{var}', maxOptionsArr[2][maxOptions > 1 ? 0 : 1]);
                    maxTxtGrp = maxTxtGrp.replace('{var}', maxOptionsArr[2][maxOptionsGrp > 1 ? 0 : 1]);
                  }

                  $option.prop('selected', false);

                  that.$menu.append($notify);

                  if (maxOptions && maxReached) {
                    $notify.append($('<div>' + maxTxt + '</div>'));
                    that.$element.trigger('maxReached.bs.select');
                  }

                  if (maxOptionsGrp && maxReachedGrp) {
                    $notify.append($('<div>' + maxTxtGrp + '</div>'));
                    that.$element.trigger('maxReachedGrp.bs.select');
                  }

                  setTimeout(function () {
                    that.setSelected(clickedIndex, false);
                  }, 10);

                  $notify.delay(750).fadeOut(300, function () {
                    $(this).remove();
                  });
                }
              }
            }
          }

          if (!that.multiple) {
            that.$button.focus();
          } else if (that.options.liveSearch) {
            that.$searchbox.focus();
          }

          // Trigger select 'change'
          if ((prevValue != that.$element.val() && that.multiple) || (prevIndex != that.$element.prop('selectedIndex') && !that.multiple)) {
            that.$element.change();
            // $option.prop('selected') is current option state (selected/unselected). state is previous option state.
            that.$element.trigger('changed.bs.select', [clickedIndex, $option.prop('selected'), state]);
          }
        }
      });

      this.$menu.on('click', 'li.disabled a, .popover-title, .popover-title :not(.close)', function (e) {
        if (e.currentTarget == this) {
          e.preventDefault();
          e.stopPropagation();
          if (that.options.liveSearch && !$(e.target).hasClass('close')) {
            that.$searchbox.focus();
          } else {
            that.$button.focus();
          }
        }
      });

      this.$menu.on('click', 'li.divider, li.dropdown-header', function (e) {
        e.preventDefault();
        e.stopPropagation();
        if (that.options.liveSearch) {
          that.$searchbox.focus();
        } else {
          that.$button.focus();
        }
      });

      this.$menu.on('click', '.popover-title .close', function () {
        that.$button.click();
      });

      this.$searchbox.on('click', function (e) {
        e.stopPropagation();
      });

      this.$menu.on('click', '.actions-btn', function (e) {
        if (that.options.liveSearch) {
          that.$searchbox.focus();
        } else {
          that.$button.focus();
        }

        e.preventDefault();
        e.stopPropagation();

        if ($(this).hasClass('bs-select-all')) {
          that.selectAll();
        } else {
          that.deselectAll();
        }
        that.$element.change();
      });

      this.$element.change(function () {
        that.render(false);
      });
    },

    liveSearchListener: function () {
      var that = this,
          $no_results = $('<li class="no-results"></li>');

      this.$newElement.on('click.dropdown.data-api touchstart.dropdown.data-api', function () {
        that.$menuInner.find('.active').removeClass('active');
        if (!!that.$searchbox.val()) {
          that.$searchbox.val('');
          that.$lis.not('.is-hidden').removeClass('hidden');
          if (!!$no_results.parent().length) $no_results.remove();
        }
        if (!that.multiple) that.$menuInner.find('.selected').addClass('active');
        setTimeout(function () {
          that.$searchbox.focus();
        }, 10);
      });

      this.$searchbox.on('click.dropdown.data-api focus.dropdown.data-api touchend.dropdown.data-api', function (e) {
        e.stopPropagation();
      });

      this.$searchbox.on('input propertychange', function () {
        if (that.$searchbox.val()) {
          var $searchBase = that.$lis.not('.is-hidden').removeClass('hidden').children('a');
          if (that.options.liveSearchNormalize) {
            $searchBase = $searchBase.not(':a' + that._searchStyle() + '(' + normalizeToBase(that.$searchbox.val()) + ')');
          } else {
            $searchBase = $searchBase.not(':' + that._searchStyle() + '(' + that.$searchbox.val() + ')');
          }
          $searchBase.parent().addClass('hidden');

          that.$lis.filter('.dropdown-header').each(function () {
            var $this = $(this),
                optgroup = $this.data('optgroup');

            if (that.$lis.filter('[data-optgroup=' + optgroup + ']').not($this).not('.hidden').length === 0) {
              $this.addClass('hidden');
              that.$lis.filter('[data-optgroup=' + optgroup + 'div]').addClass('hidden');
            }
          });

          var $lisVisible = that.$lis.not('.hidden');

          // hide divider if first or last visible, or if followed by another divider
          $lisVisible.each(function (index) {
            var $this = $(this);

            if ($this.hasClass('divider') && (
              $this.index() === $lisVisible.eq(0).index() ||
              $this.index() === $lisVisible.last().index() ||
              $lisVisible.eq(index + 1).hasClass('divider'))) {
              $this.addClass('hidden');
            }
          });

          if (!that.$lis.not('.hidden, .no-results').length) {
            if (!!$no_results.parent().length) {
              $no_results.remove();
            }
            $no_results.html(that.options.noneResultsText.replace('{0}', '"' + htmlEscape(that.$searchbox.val()) + '"')).show();
            that.$menuInner.append($no_results);
          } else if (!!$no_results.parent().length) {
            $no_results.remove();
          }

        } else {
          that.$lis.not('.is-hidden').removeClass('hidden');
          if (!!$no_results.parent().length) {
            $no_results.remove();
          }
        }

        that.$lis.filter('.active').removeClass('active');
        that.$lis.not('.hidden, .divider, .dropdown-header').eq(0).addClass('active').children('a').focus();
        $(this).focus();
      });
    },

    _searchStyle: function () {
      var style = 'icontains';
      switch (this.options.liveSearchStyle) {
        case 'begins':
        case 'startsWith':
          style = 'ibegins';
          break;
        case 'contains':
        default:
          break; //no need to change the default
      }

      return style;
    },

    val: function (value) {
      if (typeof value !== 'undefined') {
        this.$element.val(value);
        this.render();

        return this.$element;
      } else {
        return this.$element.val();
      }
    },

    selectAll: function () {
      this.findLis();
      this.$element.find('option:enabled').not('[data-divider], [data-hidden]').prop('selected', true);
      this.$lis.not('.divider, .dropdown-header, .disabled, .hidden').addClass('selected');
      this.render(false);
    },

    deselectAll: function () {
      this.findLis();
      this.$element.find('option:enabled').not('[data-divider], [data-hidden]').prop('selected', false);
      this.$lis.not('.divider, .dropdown-header, .disabled, .hidden').removeClass('selected');
      this.render(false);
    },

    keydown: function (e) {
      var $this = $(this),
          $parent = $this.is('input') ? $this.parent().parent() : $this.parent(),
          $items,
          that = $parent.data('this'),
          index,
          next,
          first,
          last,
          prev,
          nextPrev,
          prevIndex,
          isActive,
          selector = ':not(.disabled, .hidden, .dropdown-header, .divider)',
          keyCodeMap = {
            32: ' ',
            48: '0',
            49: '1',
            50: '2',
            51: '3',
            52: '4',
            53: '5',
            54: '6',
            55: '7',
            56: '8',
            57: '9',
            59: ';',
            65: 'a',
            66: 'b',
            67: 'c',
            68: 'd',
            69: 'e',
            70: 'f',
            71: 'g',
            72: 'h',
            73: 'i',
            74: 'j',
            75: 'k',
            76: 'l',
            77: 'm',
            78: 'n',
            79: 'o',
            80: 'p',
            81: 'q',
            82: 'r',
            83: 's',
            84: 't',
            85: 'u',
            86: 'v',
            87: 'w',
            88: 'x',
            89: 'y',
            90: 'z',
            96: '0',
            97: '1',
            98: '2',
            99: '3',
            100: '4',
            101: '5',
            102: '6',
            103: '7',
            104: '8',
            105: '9'
          };

      if (that.options.liveSearch) $parent = $this.parent().parent();

      if (that.options.container) $parent = that.$menu;

      $items = $('[role=menu] li a', $parent);

      isActive = that.$menu.parent().hasClass('open');

      if (!isActive && (e.keyCode >= 48 && e.keyCode <= 57 || event.keyCode >= 65 && event.keyCode <= 90)) {
        if (!that.options.container) {
          that.setSize();
          that.$menu.parent().addClass('open');
          isActive = true;
        } else {
          that.$newElement.trigger('click');
        }
        that.$searchbox.focus();
      }

      if (that.options.liveSearch) {
        if (/(^9$|27)/.test(e.keyCode.toString(10)) && isActive && that.$menu.find('.active').length === 0) {
          e.preventDefault();
          that.$menu.parent().removeClass('open');
          if (that.options.container) that.$newElement.removeClass('open');
          that.$button.focus();
        }
        // $items contains li elements when liveSearch is enabled
        $items = $('[role=menu] li:not(.disabled, .hidden, .dropdown-header, .divider)', $parent);
        if (!$this.val() && !/(38|40)/.test(e.keyCode.toString(10))) {
          if ($items.filter('.active').length === 0) {
            $items = that.$newElement.find('li');
            if (that.options.liveSearchNormalize) {
              $items = $items.filter(':a' + that._searchStyle() + '(' + normalizeToBase(keyCodeMap[e.keyCode]) + ')');
            } else {
              $items = $items.filter(':' + that._searchStyle() + '(' + keyCodeMap[e.keyCode] + ')');
            }
          }
        }
      }

      if (!$items.length) return;

      if (/(38|40)/.test(e.keyCode.toString(10))) {
        index = $items.index($items.filter(':focus'));
        first = $items.parent(selector).first().data('originalIndex');
        last = $items.parent(selector).last().data('originalIndex');
        next = $items.eq(index).parent().nextAll(selector).eq(0).data('originalIndex');
        prev = $items.eq(index).parent().prevAll(selector).eq(0).data('originalIndex');
        nextPrev = $items.eq(next).parent().prevAll(selector).eq(0).data('originalIndex');

        if (that.options.liveSearch) {
          $items.each(function (i) {
            if (!$(this).hasClass('disabled')) {
              $(this).data('index', i);
            }
          });
          index = $items.index($items.filter('.active'));
          first = $items.first().data('index');
          last = $items.last().data('index');
          next = $items.eq(index).nextAll().eq(0).data('index');
          prev = $items.eq(index).prevAll().eq(0).data('index');
          nextPrev = $items.eq(next).prevAll().eq(0).data('index');
        }

        prevIndex = $this.data('prevIndex');

        if (e.keyCode == 38) {
          if (that.options.liveSearch) index -= 1;
          if (index != nextPrev && index > prev) index = prev;
          if (index < first) index = first;
          if (index == prevIndex) index = last;
        } else if (e.keyCode == 40) {
          if (that.options.liveSearch) index += 1;
          if (index == -1) index = 0;
          if (index != nextPrev && index < next) index = next;
          if (index > last) index = last;
          if (index == prevIndex) index = first;
        }

        $this.data('prevIndex', index);

        if (!that.options.liveSearch) {
          $items.eq(index).focus();
        } else {
          e.preventDefault();
          if (!$this.hasClass('dropdown-toggle')) {
            $items.removeClass('active').eq(index).addClass('active').children('a').focus();
            $this.focus();
          }
        }

      } else if (!$this.is('input')) {
        var keyIndex = [],
            count,
            prevKey;

        $items.each(function () {
          if (!$(this).parent().hasClass('disabled')) {
            if ($.trim($(this).text().toLowerCase()).substring(0, 1) == keyCodeMap[e.keyCode]) {
              keyIndex.push($(this).parent().index());
            }
          }
        });

        count = $(document).data('keycount');
        count++;
        $(document).data('keycount', count);

        prevKey = $.trim($(':focus').text().toLowerCase()).substring(0, 1);

        if (prevKey != keyCodeMap[e.keyCode]) {
          count = 1;
          $(document).data('keycount', count);
        } else if (count >= keyIndex.length) {
          $(document).data('keycount', 0);
          if (count > keyIndex.length) count = 1;
        }

        $items.eq(keyIndex[count - 1]).focus();
      }

      // Select focused option if "Enter", "Spacebar" or "Tab" (when selectOnTab is true) are pressed inside the menu.
      if ((/(13|32)/.test(e.keyCode.toString(10)) || (/(^9$)/.test(e.keyCode.toString(10)) && that.options.selectOnTab)) && isActive) {
        if (!/(32)/.test(e.keyCode.toString(10))) e.preventDefault();
        if (!that.options.liveSearch) {
          var elem = $(':focus');
          elem.click();
          // Bring back focus for multiselects
          elem.focus();
          // Prevent screen from scrolling if the user hit the spacebar
          e.preventDefault();
          // Fixes spacebar selection of dropdown items in FF & IE
          $(document).data('spaceSelect', true);
        } else if (!/(32)/.test(e.keyCode.toString(10))) {
          that.$menu.find('.active a').click();
          $this.focus();
        }
        $(document).data('keycount', 0);
      }

      if ((/(^9$|27)/.test(e.keyCode.toString(10)) && isActive && (that.multiple || that.options.liveSearch)) || (/(27)/.test(e.keyCode.toString(10)) && !isActive)) {
        that.$menu.parent().removeClass('open');
        if (that.options.container) that.$newElement.removeClass('open');
        that.$button.focus();
      }
    },

    mobile: function () {
      this.$element.addClass('mobile-device').appendTo(this.$newElement);
      if (this.options.container) this.$menu.hide();
    },

    refresh: function () {
      this.$lis = null;
      this.reloadLi();
      this.render();
      this.checkDisabled();
      this.liHeight(true);
      this.setStyle();
      this.setWidth();
      if (this.$lis) this.$searchbox.trigger('propertychange');

      this.$element.trigger('refreshed.bs.select');
    },

    hide: function () {
      this.$newElement.hide();
    },

    show: function () {
      this.$newElement.show();
    },

    remove: function () {
      this.$newElement.remove();
      this.$element.remove();
    }
  };

  // SELECTPICKER PLUGIN DEFINITION
  // ==============================
  function Plugin(option, event) {
    // get the args of the outer function..
    var args = arguments;
    // The arguments of the function are explicitly re-defined from the argument list, because the shift causes them
    // to get lost/corrupted in android 2.3 and IE9 #715 #775
    var _option = option,
        _event = event;
    [].shift.apply(args);

    var value;
    var chain = this.each(function () {
      var $this = $(this);
      if ($this.is('select')) {
        var data = $this.data('selectpicker'),
            options = typeof _option == 'object' && _option;

        if (!data) {
          var config = $.extend({}, Selectpicker.DEFAULTS, $.fn.selectpicker.defaults || {}, $this.data(), options);
          $this.data('selectpicker', (data = new Selectpicker(this, config, _event)));
        } else if (options) {
          for (var i in options) {
            if (options.hasOwnProperty(i)) {
              data.options[i] = options[i];
            }
          }
        }

        if (typeof _option == 'string') {
          if (data[_option] instanceof Function) {
            value = data[_option].apply(data, args);
          } else {
            value = data.options[_option];
          }
        }
      }
    });

    if (typeof value !== 'undefined') {
      //noinspection JSUnusedAssignment
      return value;
    } else {
      return chain;
    }
  }

  var old = $.fn.selectpicker;
  $.fn.selectpicker = Plugin;
  $.fn.selectpicker.Constructor = Selectpicker;

  // SELECTPICKER NO CONFLICT
  // ========================
  $.fn.selectpicker.noConflict = function () {
    $.fn.selectpicker = old;
    return this;
  };

  $(document)
      .data('keycount', 0)
      .on('keydown', '.bootstrap-select [data-toggle=dropdown], .bootstrap-select [role="menu"], .bs-searchbox input', Selectpicker.prototype.keydown)
      .on('focusin.modal', '.bootstrap-select [data-toggle=dropdown], .bootstrap-select [role="menu"], .bs-searchbox input', function (e) {
        e.stopPropagation();
      });

  // SELECTPICKER DATA-API
  // =====================
  $(window).on('load.bs.select.data-api', function () {
    $('.selectpicker').each(function () {
      var $selectpicker = $(this);
      Plugin.call($selectpicker, $selectpicker.data());
    })
  });
})(jQuery);


}));
// Tooltip

$("[data-tt=tooltip]").tooltip();

$("[data-toggle=popover]")
    .popover()
    .click(function (e) {
      e.preventDefault();
});



$('.chosen').chosen({
    width: '100%'
});
$('.chosen-select').chosen({
    disable_search_threshold: 10,
    width: '100%'
});

//daterangepicker
$('.drp').daterangepicker({
});

//alert
$('.swal-warning-confirm').on('click', function() {
  swal({
      title: 'Are you sure?',
      text: 'You will not be able to recover this file?',
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#DD6B55',
      confirmButtonText: 'Yes, delete it!',
      closeOnConfirm: false,
  }, function() {
      swal('Deleted', 'File has been deleted', 'success');
  });
});

//nestable
$('#nestable').nestable({
   group: 1
});

//multiple select
;









