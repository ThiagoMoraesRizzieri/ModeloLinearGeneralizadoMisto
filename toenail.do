*Resultados de Ensayo Clínico Aleatorizado sobre la infección por hongos en las uñas del pie (Onicomicosis). 
*Dicho estudio comparaba dos tratamientos orales: 0-Terbinafina (250 mg/día) y 1-Itraconazol (200 mg/día). 

*Estructura basica: mediciones repetidas (visitas) dentro de cada paciente.

*Los pacientes fueron evaluados durante 7 visitas (desde el inicio hasta 48 semanas, no todos por igual, con diferentes intervalos de tiempo). 
*Covariables: paciente (identificacion), la variable de respuesta, outcome, de naturaleza binaria (0 = infección ausente o leve; 1 = moderada/severa), el tipo de tratamento: 0 = itraconazol; 1 = terbinafina, la visita (como número o orden de revision),  de 1 a 7, y por ultimo, la variable mes que describe el tiempo exacto de tratamiento, en meses.

*observamos estructura de datos*
xtdes, i(paciente) t (visita)

label define tratlbl 0 "Itraconazole" 1 "Terbinafine"
label values tratamento tratlbl


*Exploratorio
tab outcome 
tab outcome tratamento
tab outcome visita
graph bar, over(outcome) over(tratamento, label(angle(0)))
graph bar, over(outcome) over(visita)
graph bar (mean) proportion=outcome, over(visita) by(tratamento) ytitle(Proportion with onycholysis)

*o alternativamente, la curva over time*
egen prop = mean(outcome), by(tratamento visita)
egen mn_mes = mean(mes), by(tratamento visita)
twoway line prop mn_mes, by(tratamento) sort xtitle(Time in months) ytitle(Proportion of onycholysis)

*Cada paciente tiene su propia probabilidad basal de presentar infección
melogit outcome i.tratamento c.mes || paciente:
melogit outcome i.tratamento c.mes || paciente:, or

*para cada paciente podria existir mejorias con diferente velocidad
melogit outcome i.tratamento c.mes || paciente: mes

melogit outcome i.tratamento c.mes  i.tratamento#c.mes|| paciente:

*calculando los empirical bayes*
predict ebmodal, reffects
egen num0 = total(outcome==0), by(paciente)
egen num1 = total(outcome==1), by(paciente)
list paciente num0 num1 ebmodal  if visita==1 , noobs

