(: in lattyocc db, count hapax, total, types, calculate ratios :)
declare namespace croala = "http://www.ffzg.unizg.hr/klafil/croala";

declare function croala:round2($a,$b) {
  round($a div $b * 100000) div 100
};

declare variable $genre as map(*) := map {
 "Brief": 41,
 "Dichtung": 0.1,
 "Epik" : 0.17,
 "Gelegenheitsdichtung": 0.6,
 "Lehrgedicht" : 0.16,
 "Geschichtsschreibung": 20.3,
 "Theater": 1,
 "poesis - carmen" : 0.1,
"poesis - carmen heroicum" : 0.15,
"poesis - cyclus" : 0.07,
"poesis - descriptio" : 0.13,
"poesis - didactica" : 0.16,
"poesis - ecloga" : 0.4,
"poesis - elegia" : 0.5,
"poesis - encomium" : 0.6,
"poesis - epica" : 0.17,
"poesis - epicedion" : 0.65,
"poesis - epigramma" : 0.7,
"poesis - epistula" : 0.51,
"poesis - epitaphium" : 0.651,
"poesis - epithalamium" : 0.61,
"poesis - fabula" : 0.8,
"poesis - fragmentum" : 0.01,
"poesis - hendecasyllabi" : 0.02,
"poesis - historia" : 0.171,
"poesis - hymnus" : 0.62,
"poesis - idyllium" : 0.41,
"poesis - inscriptio" : 0.71,
"poesis - lyrica" : 0.9,
"poesis - macaronicum" : 0.55,
"poesis - metamorphosis" : 0.51,
"poesis - ode" : 0.91,
"poesis - paraphrasis" : 0.06,
"poesis - paratextus poetici" : 0.02,
"poesis - poema" : 0.89,
"poesis - sapphicum" : 0.911,
"poesis - satura" : 0.52,
"poesis - sonetto" : 0.03,
"poesis - sylva" : 0.04,
"poesis - versio" : 0.05,
"poesis - versio - ex Graeco" : 0.051,
"poesis - versus intertexti" : 0.08,
"prosa oratio - acta" : 10,
"prosa oratio - acta iuridica" : 10.10,
"prosa oratio - acta officialia" : 10.20,
"prosa oratio - charta" : 10.30,
"prosa oratio - chorographia" : 20.10,
"prosa oratio - chronica" : 20,
"prosa oratio - commentarius" : 30,
"prosa oratio - dedicatio" : 40,
"prosa oratio - descriptio" : 20.20,
"prosa oratio - dialogus" : 50,
"prosa oratio - dialogus scholasticus" : 50.10,
"prosa oratio - diarium" : 60.00,
"prosa oratio - diploma" : 10.40,
"prosa oratio - donatio" : 10.50,
"prosa oratio - epistula" : 41.00,
"prosa oratio - epistula dedicatoria" : 40.40,
"prosa oratio - epistula - praefatio" : 40.50,
"prosa oratio - epitaphium" : 70.20,
"prosa oratio - epitome" : 21.00,
"prosa oratio - fabula" : 22.00,
"prosa oratio - historia" : 20.30,
"prosa oratio - historia litteraria" : 20.35,
"prosa oratio - inscriptio" : 42.00,
"prosa oratio - itinerarium" : 20.40,
"prosa oratio - lexicon" : 80,
"prosa oratio - libellus" : 90,
"prosa oratio - loci communes" : 80.20,
"prosa oratio - novella" : 22.20,
"prosa oratio - oratio" : 70.00,
"prosa oratio - oratio funebris" : 70.10,
"prosa oratio - parabola" : 22.30,
"prosa oratio - paratextus" : 43.00,
"prosa oratio - praefatio" : 43.10,
"prosa oratio - prosopographia" : 20.50,
"prosa oratio - relatio" : 19.70,
"prosa oratio - sermo" : 71.00,
"prosa oratio - testamentum" : 10.60,
"prosa oratio - tractatus" : 91.00,
"prosa oratio - versio" : 100.00,
"prosa oratio - vita" : 21.50,
"prosa oratio - vocabularium" : 80.10
};
 
 
let $csv := element csv {
for $i in //text
let $fn := $i/fn
let $gn := sum(for $a in $i/gen return map:get($genre,$a))
let $perd := fn:number(replace(data($i/perd), '[^0-9]', '')) div 10
let $f := $i//wds
let $hapax := sum(for $a in $f/vc
where fn:number($a) = 1
return $a)
let $wc := sum(for $b in $f/vc return $b)
let $total := count($f)
let $enim := for $pt in ("ego", "mihi", "me", "nos", "nostri", "nostrum", "nobis")
return element {$pt} { sum(
  for $a in $f[v[. contains text {$pt}]]/vc return fn:number($a)) }


return element t { 
$fn,
element gn { $gn } ,
element p { $perd } ,
element hap { $hapax } , 
element tot { $total }, 
element wc { $wc },
element ttr { if ($total > 0) then round($total div $wc * 100) div 100 else 0 } ,
element hapttr {  if ($hapax > 0) then round($hapax div $wc * 100) div 100 else 0 },
$enim }
}
return csv:serialize($csv)