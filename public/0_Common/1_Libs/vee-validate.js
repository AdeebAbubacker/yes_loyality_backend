/**
  * vee-validate v4.5.8
  * (c) 2022 Abdelrahman Awad
  * @license MIT
  */
!function(e,t){"object"==typeof exports&&"undefined"!=typeof module?t(exports,require("vue")):"function"==typeof define&&define.amd?define(["exports","vue"],t):t((e="undefined"!=typeof globalThis?globalThis:e||self).VeeValidate={},e.Vue)}(this,(function(e,t){"use strict";function r(e){return"function"==typeof e}function n(e){return null==e}const a=e=>null!==e&&!!e&&"object"==typeof e&&!Array.isArray(e);function i(e){return Number(e)>=0}const u={};const o=Symbol("vee-validate-form"),l=Symbol("vee-validate-field-instance"),s=Symbol("Default empty value");function d(e){return r(e)&&!!e.__locatorRef}function c(e){return!!e&&r(e.validate)}function f(e){return"checkbox"===e||"radio"===e}function v(e){return/^\[.+\]$/i.test(e)}function m(e){return"SELECT"===e.tagName}function p(e,t){return function(e,t){const r=![!1,null,void 0,0].includes(t.multiple)&&!Number.isNaN(t.multiple);return"select"===e&&"multiple"in t&&r}(e,t)||function(e,t){return function(e){return["input","textarea","select"].includes(e)}(e)&&"file"===t.type}(e,t)}function h(e){return!!e&&(!!("undefined"!=typeof Event&&r(Event)&&e instanceof Event)||!(!e||!e.srcElement))}function y(e,t){return t in e&&e[t]!==s}function g(e){return v(e)?e.replace(/\[|\]/gi,""):e}function b(e,t,r){if(!e)return r;if(v(t))return e[g(t)];return(t||"").split(/\.|\[(\d+)\]/).filter(Boolean).reduce(((e,t)=>{return(a(n=e)||Array.isArray(n))&&t in e?e[t]:r;var n}),e)}function F(e,t,r){if(v(t))return void(e[g(t)]=r);const a=t.split(/\.|\[(\d+)\]/).filter(Boolean);let u=e;for(let e=0;e<a.length;e++){if(e===a.length-1)return void(u[a[e]]=r);a[e]in u&&!n(u[a[e]])||(u[a[e]]=i(a[e+1])?[]:{}),u=u[a[e]]}}function O(e,t){Array.isArray(e)&&i(t)?e.splice(Number(t),1):a(e)&&delete e[t]}function V(e,t){if(v(t))return void delete e[g(t)];const r=t.split(/\.|\[(\d+)\]/).filter(Boolean);let i=e;for(let e=0;e<r.length;e++){if(e===r.length-1){O(i,r[e]);break}if(!(r[e]in i)||n(i[r[e]]))break;i=i[r[e]]}const u=r.map(((t,n)=>b(e,r.slice(0,n).join("."))));for(let t=u.length-1;t>=0;t--)o=u[t],(Array.isArray(o)?0===o.length:a(o)&&0===Object.keys(o).length)&&(0!==t?O(u[t-1],r[t-1]):O(e,r[0]));var o}function A(e){return Object.keys(e)}function w(e,r){const n=t.getCurrentInstance();return(null==n?void 0:n.provides[e])||t.inject(e,r)}function j(e){t.warn(`[vee-validate]: ${e}`)}function E(e){return Array.isArray(e)?e[0]:e}function S(e,t,r){if(Array.isArray(e)){const r=[...e],n=r.indexOf(t);return n>=0?r.splice(n,1):r.push(t),r}return e===t?r:t}const k=(e,t,r)=>t.slots.default?"string"!=typeof e&&e?{default:()=>{var e,n;return null===(n=(e=t.slots).default)||void 0===n?void 0:n.call(e,r())}}:t.slots.default(r()):t.slots.default;function B(e){if(M(e))return e._value}function M(e){return"_value"in e}function I(e){if(!h(e))return e;const t=e.target;if(f(t.type)&&M(t))return B(t);if("file"===t.type&&t.files)return Array.from(t.files);if(m(r=t)&&r.multiple)return Array.from(t.options).filter((e=>e.selected&&!e.disabled)).map(B);var r;if(m(t)){const e=Array.from(t.options).find((e=>e.selected));return e?B(e):t.value}return t.value}function T(e){const t={};return Object.defineProperty(t,"_$$isNormalized",{value:!0,writable:!1,enumerable:!1,configurable:!1}),e?a(e)&&e._$$isNormalized?e:a(e)?Object.keys(e).reduce(((t,r)=>{const n=function(e){if(!0===e)return[];if(Array.isArray(e))return e;if(a(e))return e;return[e]}(e[r]);return!1!==e[r]&&(t[r]=C(n)),t}),t):"string"!=typeof e?t:e.split("|").reduce(((e,t)=>{const r=R(t);return r.name?(e[r.name]=C(r.params),e):e}),t):t}function C(e){const t=e=>"string"==typeof e&&"@"===e[0]?function(e){const t=t=>b(t,e)||t[e];return t.__locatorRef=e,t}(e.slice(1)):e;return Array.isArray(e)?e.map(t):e instanceof RegExp?[e]:Object.keys(e).reduce(((r,n)=>(r[n]=t(e[n]),r)),{})}const R=e=>{let t=[];const r=e.split(":")[0];return e.includes(":")&&(t=e.split(":").slice(1).join(":").split(",")),{name:r,params:t}};let x=Object.assign({},{generateMessage:({field:e})=>`${e} is not valid.`,bails:!0,validateOnBlur:!0,validateOnChange:!0,validateOnInput:!1,validateOnModelUpdate:!0});const P=()=>x,N=e=>{x=Object.assign(Object.assign({},x),e)};async function _(e,t,n={}){const a=null==n?void 0:n.bails,i={name:(null==n?void 0:n.name)||"{field}",rules:t,bails:null==a||a,formData:(null==n?void 0:n.values)||{}},u=await async function(e,t){if(c(e.rules))return async function(e,t,r){var n;return{errors:await t.validate(e,{abortEarly:null===(n=r.bails)||void 0===n||n}).then((()=>[])).catch((e=>{if("ValidationError"===e.name)return e.errors;throw e}))}}(t,e.rules,{bails:e.bails});if(r(e.rules)){const r={field:e.name,form:e.formData,value:t},n=await e.rules(t,r),a="string"!=typeof n&&n,i="string"==typeof n?n:D(r);return{errors:a?[]:[i]}}const n=Object.assign(Object.assign({},e),{rules:T(e.rules)}),a=[],i=Object.keys(n.rules),u=i.length;for(let r=0;r<u;r++){const u=i[r],o=await $(n,t,{name:u,params:n.rules[u]});if(o.error&&(a.push(o.error),e.bails))return{errors:a}}return{errors:a}}(i,e),o=u.errors;return{errors:o,valid:!o.length}}async function $(e,t,r){const n=(a=r.name,u[a]);var a;if(!n)throw new Error(`No such validator '${r.name}' exists.`);const i=function(e,t){const r=e=>d(e)?e(t):e;if(Array.isArray(e))return e.map(r);return Object.keys(e).reduce(((t,n)=>(t[n]=r(e[n]),t)),{})}(r.params,e.formData),o={field:e.name,value:t,form:e.formData,rule:Object.assign(Object.assign({},r),{params:i})},l=await n(t,i,o);return"string"==typeof l?{error:l}:{error:l?void 0:D(o)}}function D(e){const t=P().generateMessage;return t?t(e):"Field is invalid"}async function U(e,t,r){const n=A(e).map((async n=>{var a,i,u;const o=await _(b(t,n),e[n],{name:(null===(a=null==r?void 0:r.names)||void 0===a?void 0:a[n])||n,values:t,bails:null===(u=null===(i=null==r?void 0:r.bailsMap)||void 0===i?void 0:i[n])||void 0===u||u});return Object.assign(Object.assign({},o),{path:n})}));let a=!0;const i=await Promise.all(n),u={},o={};for(const e of i)u[e.path]={valid:e.valid,errors:e.errors},e.valid||(a=!1,o[e.path]=e.errors[0]);return{valid:a,results:u,errors:o}}function q(e,t,r){"object"==typeof r.value&&(r.value=z(r.value)),r.enumerable&&!r.get&&!r.set&&r.configurable&&r.writable&&"__proto__"!==t?e[t]=r.value:Object.defineProperty(e,t,r)}function z(e){if("object"!=typeof e)return e;var t,r,n,a=0,i=Object.prototype.toString.call(e);if("[object Object]"===i?n=Object.create(e.__proto__||null):"[object Array]"===i?n=Array(e.length):"[object Set]"===i?(n=new Set,e.forEach((function(e){n.add(z(e))}))):"[object Map]"===i?(n=new Map,e.forEach((function(e,t){n.set(z(t),z(e))}))):"[object Date]"===i?n=new Date(+e):"[object RegExp]"===i?n=new RegExp(e.source,e.flags):"[object DataView]"===i?n=new e.constructor(z(e.buffer)):"[object ArrayBuffer]"===i?n=e.slice(0):"Array]"===i.slice(-6)&&(n=new e.constructor(e)),n){for(r=Object.getOwnPropertySymbols(e);a<r.length;a++)q(n,r[a],Object.getOwnPropertyDescriptor(e,r[a]));for(a=0,r=Object.getOwnPropertyNames(e);a<r.length;a++)Object.hasOwnProperty.call(n,t=r[a])&&n[t]===e[t]||q(n,t,Object.getOwnPropertyDescriptor(e,t))}return n||e}var L=function e(t,r){if(t===r)return!0;if(t&&r&&"object"==typeof t&&"object"==typeof r){if(t.constructor!==r.constructor)return!1;var n,a,i;if(Array.isArray(t)){if((n=t.length)!=r.length)return!1;for(a=n;0!=a--;)if(!e(t[a],r[a]))return!1;return!0}if(t instanceof Map&&r instanceof Map){if(t.size!==r.size)return!1;for(a of t.entries())if(!r.has(a[0]))return!1;for(a of t.entries())if(!e(a[1],r.get(a[0])))return!1;return!0}if(t instanceof Set&&r instanceof Set){if(t.size!==r.size)return!1;for(a of t.entries())if(!r.has(a[0]))return!1;return!0}if(ArrayBuffer.isView(t)&&ArrayBuffer.isView(r)){if((n=t.length)!=r.length)return!1;for(a=n;0!=a--;)if(t[a]!==r[a])return!1;return!0}if(t.constructor===RegExp)return t.source===r.source&&t.flags===r.flags;if(t.valueOf!==Object.prototype.valueOf)return t.valueOf()===r.valueOf();if(t.toString!==Object.prototype.toString)return t.toString()===r.toString();if((n=(i=Object.keys(t)).length)!==Object.keys(r).length)return!1;for(a=n;0!=a--;)if(!Object.prototype.hasOwnProperty.call(r,i[a]))return!1;for(a=n;0!=a--;){var u=i[a];if(!e(t[u],r[u]))return!1}return!0}return t!=t&&r!=r};let K=0;function G(e,r){const{value:n,initialValue:a,setInitialValue:i}=function(e,r,n){const a=n?w(o,void 0):void 0,i=t.ref(t.unref(r));function u(){return a?b(a.meta.value.initialValues,t.unref(e),t.unref(i)):t.unref(i)}function l(r){a?a.setFieldInitialValue(t.unref(e),r):i.value=r}const s=t.computed(u);if(!a){return{value:t.ref(u()),initialValue:s,setInitialValue:l}}const d=r?t.unref(r):b(a.values,t.unref(e),t.unref(s));a.stageInitialValue(t.unref(e),d);return{value:t.computed({get:()=>b(a.values,t.unref(e)),set(r){a.setFieldValue(t.unref(e),r)}}),initialValue:s,setInitialValue:l}}(e,r.modelValue,!r.standalone),{errorMessage:u,errors:l,setErrors:s}=function(e,r){const n=r?w(o,void 0):void 0;function a(e){return e?Array.isArray(e)?e:[e]:[]}if(!n){const e=t.ref([]);return{errors:e,errorMessage:t.computed((()=>e.value[0])),setErrors:t=>{e.value=a(t)}}}const i=t.computed((()=>n.errorBag.value[t.unref(e)]||[]));return{errors:i,errorMessage:t.computed((()=>i.value[0])),setErrors:r=>{n.setFieldErrorBag(t.unref(e),a(r))}}}(e,!r.standalone),d=function(e,r,n){const a=t.reactive({touched:!1,pending:!1,valid:!0,validated:!!t.unref(n).length,initialValue:t.computed((()=>t.unref(r))),dirty:t.computed((()=>!L(t.unref(e),t.unref(r))))});return t.watch(n,(e=>{a.valid=!e.length}),{immediate:!0,flush:"sync"}),a}(n,a,l);return{id:K>=Number.MAX_SAFE_INTEGER?0:++K,path:e,value:n,initialValue:a,meta:d,errors:l,errorMessage:u,setState:function(e){var t;"value"in e&&(n.value=e.value),"errors"in e&&s(e.errors),"touched"in e&&(d.touched=null!==(t=e.touched)&&void 0!==t?t:d.touched),"initialValue"in e&&i(e.initialValue)}}}function X(e,r,n){return f(null==n?void 0:n.type)?function(e,r,n){const a=(null==n?void 0:n.standalone)?void 0:w(o),i=null==n?void 0:n.checkedValue,u=null==n?void 0:n.uncheckedValue;function l(e){const r=e.handleChange,n=t.computed((()=>{const r=t.unref(e.value),n=t.unref(i);return Array.isArray(r)?r.includes(n):n===r}));function o(o,l=!0){var s,d;if(n.value===(null===(d=null===(s=o)||void 0===s?void 0:s.target)||void 0===d?void 0:d.checked))return;let c=I(o);a||(c=S(t.unref(e.value),t.unref(i),t.unref(u))),r(c,l)}return t.onBeforeUnmount((()=>{n.value&&o(t.unref(i),!1)})),Object.assign(Object.assign({},e),{checked:n,checkedValue:i,uncheckedValue:u,handleChange:o})}return l(H(e,r,n))}(e,r,n):H(e,r,n)}function H(e,n,a){const{initialValue:i,validateOnMount:u,bails:s,type:f,checkedValue:v,label:m,validateOnValueUpdate:p,uncheckedValue:h,standalone:y}=function(e,t){const r=()=>({initialValue:void 0,validateOnMount:!1,bails:!0,rules:"",label:e,validateOnValueUpdate:!0,standalone:!1});if(!t)return r();const n="valueProp"in t?t.valueProp:t.checkedValue;return Object.assign(Object.assign(Object.assign({},r()),t||{}),{checkedValue:n})}(t.unref(e),a),g=y?void 0:w(o),{id:F,value:O,initialValue:V,meta:j,setState:E,errors:S,errorMessage:k}=G(e,{modelValue:i,standalone:y}),B=t.computed((()=>{let a=t.unref(n);const i=t.unref(null==g?void 0:g.schema);return i&&!c(i)&&(a=function(e,t){if(!e)return;return e[t]}(i,t.unref(e))||a),c(a)||r(a)?a:T(a)}));async function M(r){var n,a;return(null==g?void 0:g.validateSchema)?null!==(n=(await g.validateSchema(r)).results[t.unref(e)])&&void 0!==n?n:{valid:!0,errors:[]}:_(O.value,B.value,{name:t.unref(m)||t.unref(e),values:null!==(a=null==g?void 0:g.values)&&void 0!==a?a:{},bails:s})}async function C(){j.pending=!0,j.validated=!0;const e=await M("validated-only");return E({errors:e.errors}),j.pending=!1,e}async function R(){const e=await M("silent");return j.valid=e.valid,e}let x;function P(){x=t.watch(O,p?C:R,{deep:!0})}function N(e){var r;null==x||x();const n=e&&"value"in e?e.value:V.value;E({value:z(n),initialValue:z(n),touched:null!==(r=null==e?void 0:e.touched)&&void 0!==r&&r,errors:(null==e?void 0:e.errors)||[]}),j.pending=!1,j.validated=!1,R(),t.nextTick((()=>{P()}))}t.onMounted((()=>{if(u)return C();g&&g.validateSchema||R()})),P();const $={id:F,name:e,label:m,value:O,meta:j,errors:S,errorMessage:k,type:f,checkedValue:v,uncheckedValue:h,bails:s,resetField:N,handleReset:()=>N(),validate:function(e){return(null==e?void 0:e.mode)&&"force"!==(null==e?void 0:e.mode)?"validated-only"===(null==e?void 0:e.mode)?C():R():C()},handleChange:(e,t=!0)=>{const r=I(e);O.value=r,!p&&t&&C()},handleBlur:()=>{j.touched=!0},setState:E,setTouched:function(e){j.touched=e},setErrors:function(e){E({errors:Array.isArray(e)?e:[e]})},setValue:function(e){O.value=e}};if(t.provide(l,$),t.isRef(n)&&"function"!=typeof t.unref(n)&&t.watch(n,((e,t)=>{L(e,t)||(j.validated?C():R())}),{deep:!0}),!g)return $;g.register($),t.onBeforeUnmount((()=>{g.unregister($)}));const D=t.computed((()=>{const e=B.value;return!e||r(e)||c(e)?{}:Object.keys(e).reduce(((t,r)=>{const n=(a=e[r],Array.isArray(a)?a.filter(d):A(a).filter((e=>d(a[e]))).map((e=>a[e]))).map((e=>e.__locatorRef)).reduce(((e,t)=>{const r=b(g.values,t)||g.values[t];return void 0!==r&&(e[t]=r),e}),{});var a;return Object.assign(t,n),t}),{})}));return t.watch(D,((e,t)=>{if(!Object.keys(e).length)return;!L(e,t)&&(j.validated?C():R())})),$}function J(e,t){let r=e.as||"";return e.as||t.slots.default||(r="input"),r}function Q(e,t){return f(t.attrs.type)?y(e,"modelValue")?e.modelValue:void 0:y(e,"modelValue")?e.modelValue:t.attrs.value}const W=t.defineComponent({name:"Field",inheritAttrs:!1,props:{as:{type:[String,Object],default:void 0},name:{type:String,required:!0},rules:{type:[Object,String,Function],default:void 0},validateOnMount:{type:Boolean,default:!1},validateOnBlur:{type:Boolean,default:void 0},validateOnChange:{type:Boolean,default:void 0},validateOnInput:{type:Boolean,default:void 0},validateOnModelUpdate:{type:Boolean,default:void 0},bails:{type:Boolean,default:()=>P().bails},label:{type:String,default:void 0},uncheckedValue:{type:null,default:void 0},modelValue:{type:null,default:s},modelModifiers:{type:null,default:()=>({})},"onUpdate:modelValue":{type:null,default:void 0},standalone:{type:Boolean,default:!1}},setup(e,r){const n=t.toRef(e,"rules"),a=t.toRef(e,"name"),i=t.toRef(e,"label"),u=t.toRef(e,"uncheckedValue"),o=y(e,"onUpdate:modelValue"),{errors:l,value:d,errorMessage:c,validate:v,handleChange:m,handleBlur:h,setTouched:g,resetField:b,handleReset:F,meta:O,checked:V,setErrors:A}=X(a,n,{validateOnMount:e.validateOnMount,bails:e.bails,standalone:e.standalone,type:r.attrs.type,initialValue:Q(e,r),checkedValue:r.attrs.value,uncheckedValue:u,label:i,validateOnValueUpdate:!1}),w=o?function(e,t=!0){m(e,t),r.emit("update:modelValue",d.value)}:m,j=e=>{f(r.attrs.type)||(d.value=I(e))},E=o?function(e){j(e),r.emit("update:modelValue",d.value)}:j,S=t.computed((()=>{const{validateOnInput:t,validateOnChange:n,validateOnBlur:a,validateOnModelUpdate:i}=function(e){var t,r,n,a;const{validateOnInput:i,validateOnChange:u,validateOnBlur:o,validateOnModelUpdate:l}=P();return{validateOnInput:null!==(t=e.validateOnInput)&&void 0!==t?t:i,validateOnChange:null!==(r=e.validateOnChange)&&void 0!==r?r:u,validateOnBlur:null!==(n=e.validateOnBlur)&&void 0!==n?n:o,validateOnModelUpdate:null!==(a=e.validateOnModelUpdate)&&void 0!==a?a:l}}(e),u=[h,r.attrs.onBlur,a?v:void 0].filter(Boolean),o=[e=>w(e,t),r.attrs.onInput].filter(Boolean),l=[e=>w(e,n),r.attrs.onChange].filter(Boolean),s={name:e.name,onBlur:u,onInput:o,onChange:l,"onUpdate:modelValue":e=>w(e,i)};f(r.attrs.type)&&V?s.checked=V.value:s.value=d.value;return p(J(e,r),r.attrs)&&delete s.value,s})),B=t.toRef(e,"modelValue");function M(){return{field:S.value,value:d.value,meta:O,errors:l.value,errorMessage:c.value,validate:v,resetField:b,handleChange:w,handleInput:E,handleReset:F,handleBlur:h,setTouched:g,setErrors:A}}return t.watch(B,(t=>{t===s&&void 0===d.value||t!==function(e,t){if(t.number)return function(e){const t=parseFloat(e);return isNaN(t)?e:t}(e);return e}(d.value,e.modelModifiers)&&(d.value=t===s?void 0:t,v())})),r.expose({setErrors:A,setTouched:g,reset:b,validate:v,handleChange:m}),()=>{const n=t.resolveDynamicComponent(J(e,r)),a=k(n,r,M);return n?t.h(n,Object.assign(Object.assign({},r.attrs),S.value),a):a}}});let Y=0;function Z(e){const r=Y++;let n=!1;const a=t.ref({}),i=t.ref(!1),u=t.ref(0),l={},s=t.reactive(z(t.unref(null==e?void 0:e.initialValues)||{})),{errorBag:d,setErrorBag:f,setFieldErrorBag:v}=function(e){const r=t.ref({});function n(e){return Array.isArray(e)?e:e?[e]:[]}function a(e,t){t?r.value[e]=n(t):delete r.value[e]}function i(e){r.value=A(e).reduce(((t,r)=>{const a=e[r];return a&&(t[r]=n(a)),t}),{})}e&&i(e);return{errorBag:r,setErrorBag:i,setFieldErrorBag:a}}(null==e?void 0:e.initialErrors),m=t.computed((()=>A(d.value).reduce(((e,t)=>{const r=d.value[t];return r&&r.length&&(e[t]=r[0]),e}),{})));function p(e){const t=a.value[e];return Array.isArray(t)?t[0]:t}function y(e){return!!a.value[e]}const g=t.computed((()=>A(a.value).reduce(((e,r)=>{const n=p(r);return n&&(e[r]=t.unref(n.label||n.name)||""),e}),{}))),O=t.computed((()=>A(a.value).reduce(((e,t)=>{var r;const n=p(t);return n&&(e[t]=null===(r=n.bails)||void 0===r||r),e}),{}))),w=Object.assign({},(null==e?void 0:e.initialErrors)||{}),{initialValues:j,originalInitialValues:E,setInitialValues:k}=function(e,r,n){const a=t.ref(z(t.unref(n))||{}),i=t.ref(z(t.unref(n))||{});function u(t,n=!1){a.value=z(t),i.value=z(t),n&&A(e.value).forEach((t=>{const n=e.value[t],i=Array.isArray(n)?n.some((e=>e.meta.touched)):null==n?void 0:n.meta.touched;if(!n||i)return;const u=b(a.value,t);F(r,t,z(u))}))}t.isRef(n)&&t.watch(n,(e=>{u(e,!0)}),{deep:!0});return{initialValues:a,originalInitialValues:i,setInitialValues:u}}(a,s,null==e?void 0:e.initialValues),B=function(e,r,n,a){const i={touched:"some",pending:"some",valid:"every"},u=t.computed((()=>!L(r,t.unref(n))));function o(){const t=Object.values(e.value).flat(1).filter(Boolean);return A(i).reduce(((e,r)=>{const n=i[r];return e[r]=t[n]((e=>e.meta[r])),e}),{})}const l=t.reactive(o());return t.watchEffect((()=>{const e=o();l.touched=e.touched,l.valid=e.valid,l.pending=e.pending})),t.computed((()=>Object.assign(Object.assign({initialValues:t.unref(n)},l),{valid:l.valid&&!A(a.value).length,dirty:u.value})))}(a,s,j,m),M=null==e?void 0:e.validationSchema,I={formId:r,fieldsByPath:a,values:s,errorBag:d,errors:m,schema:M,submitCount:u,meta:B,isSubmitting:i,fieldArraysLookup:l,validateSchema:t.unref(M)?async function(e){const t=await Q(),r=I.fieldsByPath.value||{},n=A(I.errorBag.value);return[...new Set([...A(t.results),...A(r),...n])].reduce(((n,a)=>{const i=r[a],u=(t.results[a]||{errors:[]}).errors,o={errors:u,valid:!u.length};if(n.results[a]=o,o.valid||(n.errors[a]=o.errors[0]),!i)return R(a,u),n;if(C(i,(e=>e.meta.valid=o.valid)),"silent"===e)return n;const l=Array.isArray(i)?i.some((e=>e.meta.validated)):i.meta.validated;return"validated-only"!==e||l?(C(i,(e=>e.setState({errors:o.errors}))),n):n}),{valid:t.valid,results:{},errors:{}})}:void 0,validate:G,register:function(e){const r=t.unref(e.name);q(e,r),t.isRef(e.name)&&t.watch(e.name,(async(r,n)=>{await t.nextTick(),K(e,n),q(e,r),(m.value[n]||m.value[r])&&(R(n,void 0),X(r)),await t.nextTick(),y(n)||V(s,n)}));const n=t.unref(e.errorMessage);n&&(null==w?void 0:w[r])!==n&&X(r);delete w[r]},unregister:function(e){const r=t.unref(e.name);K(e,r),t.nextTick((()=>{y(r)||(R(r,void 0),V(s,r))}))},setFieldErrorBag:v,validateField:X,setFieldValue:P,setValues:N,setErrors:x,setFieldError:R,setFieldTouched:_,setTouched:$,resetForm:D,handleSubmit:H,stageInitialValue:function(e,t){F(s,e,t),J(e,t)},unsetInitialValue:function(e){V(j.value,e)},setFieldInitialValue:J};function T(e){return Array.isArray(e)}function C(e,t){return Array.isArray(e)?e.forEach(t):t(e)}function R(e,t){v(e,t)}function x(e){f(e)}function P(e,r,{force:i}={force:!1}){var u;const o=a.value[e],l=z(r);if(!o)return void F(s,e,l);if(T(o)&&"checkbox"===(null===(u=o[0])||void 0===u?void 0:u.type)&&!Array.isArray(r)){const t=z(S(b(s,e)||[],r,void 0));return void F(s,e,t)}let d=r;T(o)||"checkbox"!==o.type||i||n||(d=z(S(b(s,e),r,t.unref(o.uncheckedValue)))),F(s,e,d)}function N(e){A(s).forEach((e=>{delete s[e]})),A(e).forEach((t=>{P(t,e[t])})),Object.values(l).forEach((e=>e&&e.reset()))}function _(e,t){const r=a.value[e];r&&C(r,(e=>e.setTouched(t)))}function $(e){A(e).forEach((t=>{_(t,!!e[t])}))}function D(e){n=!0,(null==e?void 0:e.values)?(k(e.values),N(null==e?void 0:e.values)):(k(E.value),N(E.value)),Object.values(a.value).forEach((e=>{e&&C(e,(e=>e.resetField()))})),(null==e?void 0:e.touched)&&$(e.touched),x((null==e?void 0:e.errors)||{}),u.value=(null==e?void 0:e.submitCount)||0,t.nextTick((()=>{n=!1}))}function q(e,r){const n=t.markRaw(e),i=r;if(!a.value[i])return void(a.value[i]=n);const u=a.value[i];u&&!Array.isArray(u)&&(a.value[i]=[u]),a.value[i]=[...a.value[i],n]}function K(e,t){const r=t,n=a.value[r];if(n)if(T(n)||e.id!==n.id){if(T(n)){const t=n.findIndex((t=>t.id===e.id));if(-1===t)return;if(n.splice(t,1),1===n.length)return void(a.value[r]=n[0]);n.length||delete a.value[r]}}else delete a.value[r]}async function G(e){if(I.validateSchema)return I.validateSchema((null==e?void 0:e.mode)||"force");const r=await Promise.all(Object.values(a.value).map((r=>{const n=Array.isArray(r)?r[0]:r;return n?n.validate(e).then((e=>({key:t.unref(n.name),valid:e.valid,errors:e.errors}))):Promise.resolve({key:"",valid:!0,errors:[]})}))),n={},i={};for(const e of r)n[e.key]={valid:e.valid,errors:e.errors},e.errors.length&&(i[e.key]=e.errors[0]);return{valid:r.every((e=>e.valid)),results:n,errors:i}}async function X(e){const r=a.value[e];return r?Array.isArray(r)?r.map((e=>e.validate()))[0]:r.validate():(t.warn(`field with name ${e} was not found`),Promise.resolve({errors:[],valid:!0}))}function H(e,t){return function(r){return r instanceof Event&&(r.preventDefault(),r.stopPropagation()),$(A(a.value).reduce(((e,t)=>(e[t]=!0,e)),{})),i.value=!0,u.value++,G().then((n=>{if(n.valid&&"function"==typeof e)return e(z(s),{evt:r,setErrors:x,setFieldError:R,setTouched:$,setFieldTouched:_,setValues:N,setFieldValue:P,resetForm:D});n.valid||"function"!=typeof t||t({values:z(s),evt:r,errors:n.errors,results:n.results})})).then((e=>(i.value=!1,e)),(e=>{throw i.value=!1,e}))}}function J(e,t){F(j.value,e,z(t))}const Q=function(e,t=0){let r=null,n=[];return function(...a){return r&&window.clearTimeout(r),r=window.setTimeout((()=>{const t=e(...a);n.forEach((e=>e(t))),n=[]}),t),new Promise((e=>n.push(e)))}}((async function(){const e=t.unref(M);if(!e)return{valid:!0,results:{},errors:{}};const r=c(e)?await async function(e,t){const r=await e.validate(t,{abortEarly:!1}).then((()=>[])).catch((e=>{if("ValidationError"!==e.name)throw e;return e.inner||[]})),n={},a={};for(const e of r){const t=e.errors;n[e.path]={valid:!t.length,errors:t},t.length&&(a[e.path]=t[0])}return{valid:!r.length,results:n,errors:a}}(e,s):await U(e,s,{names:g.value,bailsMap:O.value});return r}),5);const W=H(((e,{evt:t})=>{(function(e){return h(e)&&e.target&&"submit"in e.target})(t)&&t.target.submit()}));return t.onMounted((()=>{(null==e?void 0:e.initialErrors)&&x(e.initialErrors),(null==e?void 0:e.initialTouched)&&$(e.initialTouched),(null==e?void 0:e.validateOnMount)?G():I.validateSchema&&I.validateSchema("silent")})),t.isRef(M)&&t.watch(M,(()=>{var e;null===(e=I.validateSchema)||void 0===e||e.call(I,"validated-only")})),t.provide(o,I),{errors:m,meta:B,values:s,isSubmitting:i,submitCount:u,validate:G,validateField:X,handleReset:()=>D(),resetForm:D,handleSubmit:H,submitForm:W,setFieldError:R,setErrors:x,setFieldValue:P,setValues:N,setFieldTouched:_,setTouched:$}}const ee=t.defineComponent({name:"Form",inheritAttrs:!1,props:{as:{type:String,default:"form"},validationSchema:{type:Object,default:void 0},initialValues:{type:Object,default:void 0},initialErrors:{type:Object,default:void 0},initialTouched:{type:Object,default:void 0},validateOnMount:{type:Boolean,default:!1},onSubmit:{type:Function,default:void 0},onInvalidSubmit:{type:Function,default:void 0}},setup(e,r){const n=t.toRef(e,"initialValues"),a=t.toRef(e,"validationSchema"),{errors:i,values:u,meta:o,isSubmitting:l,submitCount:s,validate:d,validateField:c,handleReset:f,resetForm:v,handleSubmit:m,submitForm:p,setErrors:y,setFieldError:g,setFieldValue:b,setValues:F,setFieldTouched:O,setTouched:V}=Z({validationSchema:a.value?a:void 0,initialValues:n,initialErrors:e.initialErrors,initialTouched:e.initialTouched,validateOnMount:e.validateOnMount}),A=e.onSubmit?m(e.onSubmit,e.onInvalidSubmit):p;function w(e){h(e)&&e.preventDefault(),f(),"function"==typeof r.attrs.onReset&&r.attrs.onReset()}function j(t,r){return m("function"!=typeof t||r?r:t,e.onInvalidSubmit)(t)}function E(){return{meta:o.value,errors:i.value,values:u,isSubmitting:l.value,submitCount:s.value,validate:d,validateField:c,handleSubmit:j,handleReset:f,submitForm:p,setErrors:y,setFieldError:g,setFieldValue:b,setValues:F,setFieldTouched:O,setTouched:V,resetForm:v}}return r.expose({setFieldError:g,setErrors:y,setFieldValue:b,setValues:F,setFieldTouched:O,setTouched:V,resetForm:v,validate:d,validateField:c}),function(){const n="form"===e.as?e.as:t.resolveDynamicComponent(e.as),a=k(n,r,E);if(!e.as)return a;const i="form"===e.as?{novalidate:!0}:{};return t.h(n,Object.assign(Object.assign(Object.assign({},i),r.attrs),{onSubmit:A,onReset:w}),a)}}}),te=ee;let re=0;function ne(e){const r=re++,a=w(o,void 0),i=t.ref([]),u=()=>{},l={fields:t.readonly(i),remove:u,push:u,swap:u,insert:u,update:u,replace:u,prepend:u};if(!a)return j("FieldArray requires being a child of `<Form/>` or `useForm` being called before it. Array fields may not work correctly"),l;if(!t.unref(e))return j("FieldArray requires a field path to be provided, did you forget to pass the `name` prop?"),l;let s=0;function d(){const r=b(null==a?void 0:a.values,t.unref(e),[]);i.value=r.map(f),c()}function c(){const e=i.value.length;for(let t=0;t<e;t++){const r=i.value[t];r.isFirst=0===t,r.isLast=t===e-1}}function f(r){const n=s++;return{key:n,value:t.computed((()=>{const u=b(null==a?void 0:a.values,t.unref(e),[]),o=i.value.findIndex((e=>e.key===n));return-1===o?r:u[o]})),isFirst:!1,isLast:!1}}return d(),a.fieldArraysLookup[r]={reset:d},t.onBeforeUnmount((()=>{delete a.fieldArraysLookup[r]})),{fields:t.readonly(i),remove:function(r){const n=t.unref(e),u=b(null==a?void 0:a.values,n);if(!u||!Array.isArray(u))return;const o=[...u];o.splice(r,1),null==a||a.unsetInitialValue(n+`[${r}]`),null==a||a.setFieldValue(n,o),i.value.splice(r,1),c()},push:function(r){const u=t.unref(e),o=b(null==a?void 0:a.values,u),l=n(o)?[]:o;if(!Array.isArray(l))return;const s=[...l];s.push(r),null==a||a.stageInitialValue(u+`[${s.length-1}]`,r),null==a||a.setFieldValue(u,s),i.value.push(f(r)),c()},swap:function(r,n){const u=t.unref(e),o=b(null==a?void 0:a.values,u);if(!Array.isArray(o)||!(r in o)||!(n in o))return;const l=[...o],s=[...i.value],d=l[r];l[r]=l[n],l[n]=d;const f=s[r];s[r]=s[n],s[n]=f,null==a||a.setFieldValue(u,l),i.value=s,c()},insert:function(r,n){const u=t.unref(e),o=b(null==a?void 0:a.values,u);if(!Array.isArray(o)||o.length<r)return;const l=[...o],s=[...i.value];l.splice(r,0,n),s.splice(r,0,f(n)),null==a||a.setFieldValue(u,l),i.value=s,c()},update:function(r,n){const i=t.unref(e),u=b(null==a?void 0:a.values,i);!Array.isArray(u)||u.length-1<r||null==a||a.setFieldValue(`${i}[${r}]`,n)},replace:function(r){const n=t.unref(e);null==a||a.setFieldValue(n,r),d()},prepend:function(r){const u=t.unref(e),o=b(null==a?void 0:a.values,u),l=n(o)?[]:o;if(!Array.isArray(l))return;const s=[r,...l];null==a||a.stageInitialValue(u+`[${s.length-1}]`,r),null==a||a.setFieldValue(u,s),i.value.unshift(f(r)),c()}}}const ae=t.defineComponent({name:"FieldArray",inheritAttrs:!1,props:{name:{type:String,required:!0}},setup(e,r){const{push:n,remove:a,swap:i,insert:u,replace:o,update:l,prepend:s,fields:d}=ne(t.toRef(e,"name"));function c(){return{fields:d.value,push:n,remove:a,swap:i,insert:u,update:l,replace:o,prepend:s}}return r.expose({push:n,remove:a,swap:i,insert:u,update:l,replace:o,prepend:s}),()=>k(void 0,r,c)}}),ie=t.defineComponent({name:"ErrorMessage",props:{as:{type:String,default:void 0},name:{type:String,required:!0}},setup(e,r){const n=t.inject(o,void 0),a=t.computed((()=>null==n?void 0:n.errors.value[e.name]));function i(){return{message:a.value}}return()=>{if(!a.value)return;const n=e.as?t.resolveDynamicComponent(e.as):e.as,u=k(n,r,i),o=Object.assign({role:"alert"},r.attrs);return n||!Array.isArray(u)&&u||!(null==u?void 0:u.length)?!Array.isArray(u)&&u||(null==u?void 0:u.length)?t.h(n,o,u):t.h(n||"span",o,a.value):u}}});e.ErrorMessage=ie,e.Field=W,e.FieldArray=ae,e.FieldContextKey=l,e.Form=te,e.FormContextKey=o,e.configure=N,e.defineRule=function(e,t){!function(e,t){if(r(t))return;throw new Error(`Extension Error: The validator '${e}' must be a function.`)}(e,t),u[e]=t},e.useField=X,e.useFieldArray=ne,e.useFieldError=function(e){const r=w(o),n=e?void 0:t.inject(l);return t.computed((()=>e?null==r?void 0:r.errors.value[t.unref(e)]:null==n?void 0:n.errorMessage.value))},e.useFieldValue=function(e){const r=w(o),n=e?void 0:t.inject(l);return t.computed((()=>e?b(null==r?void 0:r.values,t.unref(e)):t.unref(null==n?void 0:n.value)))},e.useForm=Z,e.useFormErrors=function(){const e=w(o);return e||j("No vee-validate <Form /> or `useForm` was detected in the component tree"),t.computed((()=>(null==e?void 0:e.errors.value)||{}))},e.useFormValues=function(){const e=w(o);return e||j("No vee-validate <Form /> or `useForm` was detected in the component tree"),t.computed((()=>(null==e?void 0:e.values)||{}))},e.useIsFieldDirty=function(e){const r=w(o);let n=e?void 0:t.inject(l);return t.computed((()=>(e&&(n=E(null==r?void 0:r.fieldsByPath.value[t.unref(e)])),n?n.meta.dirty:(j(`field with name ${t.unref(e)} was not found`),!1))))},e.useIsFieldTouched=function(e){const r=w(o);let n=e?void 0:t.inject(l);return t.computed((()=>(e&&(n=E(null==r?void 0:r.fieldsByPath.value[t.unref(e)])),n?n.meta.touched:(j(`field with name ${t.unref(e)} was not found`),!1))))},e.useIsFieldValid=function(e){const r=w(o);let n=e?void 0:t.inject(l);return t.computed((()=>(e&&(n=E(null==r?void 0:r.fieldsByPath.value[t.unref(e)])),n?n.meta.valid:(j(`field with name ${t.unref(e)} was not found`),!1))))},e.useIsFormDirty=function(){const e=w(o);return e||j("No vee-validate <Form /> or `useForm` was detected in the component tree"),t.computed((()=>{var t;return null!==(t=null==e?void 0:e.meta.value.dirty)&&void 0!==t&&t}))},e.useIsFormTouched=function(){const e=w(o);return e||j("No vee-validate <Form /> or `useForm` was detected in the component tree"),t.computed((()=>{var t;return null!==(t=null==e?void 0:e.meta.value.touched)&&void 0!==t&&t}))},e.useIsFormValid=function(){const e=w(o);return e||j("No vee-validate <Form /> or `useForm` was detected in the component tree"),t.computed((()=>{var t;return null!==(t=null==e?void 0:e.meta.value.valid)&&void 0!==t&&t}))},e.useIsSubmitting=function(){const e=w(o);return e||j("No vee-validate <Form /> or `useForm` was detected in the component tree"),t.computed((()=>{var t;return null!==(t=null==e?void 0:e.isSubmitting.value)&&void 0!==t&&t}))},e.useResetForm=function(){const e=w(o);return e||j("No vee-validate <Form /> or `useForm` was detected in the component tree"),function(t){if(e)return e.resetForm(t)}},e.useSubmitCount=function(){const e=w(o);return e||j("No vee-validate <Form /> or `useForm` was detected in the component tree"),t.computed((()=>{var t;return null!==(t=null==e?void 0:e.submitCount.value)&&void 0!==t?t:0}))},e.useSubmitForm=function(e){const t=w(o);t||j("No vee-validate <Form /> or `useForm` was detected in the component tree");const r=t?t.handleSubmit(e):void 0;return function(e){if(r)return r(e)}},e.useValidateField=function(e){const r=w(o);let n=e?void 0:t.inject(l);return function(){return e&&(n=E(null==r?void 0:r.fieldsByPath.value[t.unref(e)])),n?n.validate():(j(`field with name ${t.unref(e)} was not found`),Promise.resolve({errors:[],valid:!0}))}},e.useValidateForm=function(){const e=w(o);return e||j("No vee-validate <Form /> or `useForm` was detected in the component tree"),function(){return e?e.validate():Promise.resolve({results:{},errors:{},valid:!0})}},e.validate=_,Object.defineProperty(e,"__esModule",{value:!0})}));