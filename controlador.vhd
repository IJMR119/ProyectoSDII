library ieee;
use ieee.std_logic_1164.all;

entity controlador is
	port (clock, resetn: in std_logic;
			--entradas
			start,borrar,or_10,despCompleto,Completo,ingreso: in std_logic;
			completoTres: in std_logic;
			vacio,noCambio,Uno,alMenosCuatro,nueve,verificacion,ninguno: in std_logic;
			listoIngreso: in std_logic;
			ledCovid,ledResfriado,ledGripe,listoTreinta: in std_logic;
			cambioDiez: in std_logic;
			boton,termina,listoRecorridoMux,sgteVuelta,desplazamientoCompleto,listoCambios: in std_logic;
			esCovid,esResfriado,esGripe: in std_logic;
			--Salidas
			enD1,ldD1,borrando,enC1,ldC1,enCI,enCIT,ldCIT,enC2,ldC2,enP,enPT,ldPT,enA,enAT,ldAT,enE,enET,ldET: out std_logic;
			enActual,enDesUno,ldDesUno,enUnoCant,ldUnoCant,enNueve,ldNueve,enV,ldV: out std_logic;
			enEnfermedad: out std_logic;
			accion,enIngreso,ldIngreso,enAdd,ldAdd: out std_logic;
			en30Segundos,ld30Segundos,ledC,ledR,ledG: out std_logic;
			enSgteM,ldSgteM,en10Segundos,ld10Segundos,ledAmarillo,ledBlanco,ledNaranja,ledRosa: out std_logic;
			enPass2,enPass,ldPass,ldPass2,enAddressROM,ldAddressROM,enCont5,ldCont5,enCont14,ldCont14, enContRecorrido,ldContRecorrido,onOff,enCol,ldCol,en10Datos,ld10Datos: out std_logic;
			enDatosListos,ldDatosListos,WR,enC5,ldC5: out std_logic
			);
			
			
end controlador;

architecture sol of controlador is
type estado is (T,TA1,TB1,TC1,TD1,TE1,TF1,TG1,TH1,TI1,TJ1,
						TK1,TL1,TM1,TN1,TO1,TP1,TQ1,TR1,TS1,
						TT1,TU1,TV1,TW1,TX1,TY1,TZ1,TAA1,TAB1,
						TAC1,TAD1,TAE1,TAF1,TAG1,TAH1,TAI1,TAJ1,TAK1,
						TAL1,TAM1,
						TAN1,TAO1,TAP1,TAQ1,
						
						TA2,TB2,TC2,TD2,TE2,TF2,TG2,TH2,TI2,TJ2,TK2,TEXTRA,TEXTRA2,
						TL2,TM2,TN2,TO2,TP2,TQ2,TR2,
						TS2,TT2,TU2,
						TV2,TW2,TX2,TY2,TZ2,TAA2,TAB2,TAC2,TAE2,TAF2,TAG2,TAH2,TAI2,TAJ2,TAK2,TAL2,TAN2,TAO2,TAP2,
						TAQ2,TAR2,TAS2,TAT2,TAU2,TAV2,TAX2);
signal y: estado;
begin
	process(resetn, clock)
	begin
		if resetn='0' then y<=T;
		elsif (clock'event and clock='1') then 
			case y is 
				when T=> y<=TA1;
				-- INGRESO DE DATOS DEL PACIENTE (ESTADOS)
				when TA1=> if start='1' then y<=TB1; else y<=TA1; end if;
				
				when TB1=> if borrar='1' then y<=TJ1; else y<=TC1; end if;
				when TC1=> if or_10='1' then y<=TD1; else y<=TB1; end if;
				when TD1=> y<=TE1;
				when TE1=> if despCompleto='1' then y<=TG1; else y<=TF1; end if;
				when TF1=> y<=TE1;
				when TG1=> if completo='1' then y<=TH1; else y<= TB1; end if;
				when TH1=> if borrar='1' then y<=TJ1; else y<=TI1; end if;
				when TI1=> if ingreso='1' then y<=TK1; else y<=TH1; end if;
				when TJ1=> y<=TB1;
				
				when TK1=> if borrar='1' then y<=TS1; else y<=TL1; end if;
				when TL1=> if or_10='1' then y<=TM1; else y<=TK1; end if;
				when TM1=> y<=TN1;
				when TN1=> if despCompleto='1' then y<=TP1; else y<=TO1; end if;
				when TO1=> y<=TN1;
				when TP1=> if completoTres='1' then y<=TQ1; else y<= TK1; end if;
				when TQ1=> if borrar='1' then y<=TS1; else y<=TR1; end if;
				when TR1=> if ingreso='1' then y<=TT1; else y<=TQ1; end if;
				when TS1=> y<=TK1;
				
				when TT1=> if borrar='1' then y<=TAB1; else y<=TU1; end if;
				when TU1=> if or_10='1' then y<=TV1; else y<=TT1; end if;
				when TV1=> y<=TW1;
				when TW1=> if despCompleto='1' then y<=TY1; else y<=TX1; end if;
				when TX1=> y<=TW1;
				when TY1=> if completoTres='1' then y<=TZ1; else y<= TT1; end if;
				when TZ1=> if borrar='1' then y<=TAB1; else y<=TAA1; end if;
				when TAA1=> if ingreso='1' then y<=TAC1; else y<=TZ1; end if;
				when TAB1=> y<=TT1;
				
				when TAC1=> if borrar='1' then y<=TAK1; else y<=TAD1; end if;
				when TAD1=> if or_10='1' then y<=TAE1; else y<=TAC1; end if;
				when TAE1=> y<=TAF1;
				when TAF1=> if despCompleto='1' then y<=TAH1; else y<=TAG1; end if;
				when TAG1=> y<=TAF1;
				when TAH1=> if completoTres='1' then y<=TAI1; else y<= TAC1; end if;
				when TAI1=> if borrar='1' then y<=TAK1; else y<=TAJ1; end if;
				when TAJ1=> if ingreso='1' then y<=TA2; else y<=TAI1; end if;
				
				-- INGRESO DE SINTOMAS Y DETERMINACION DE ENFERMEDAD (ESTADOS)
				when TA2=> if vacio='0' then y<=TEXTRA2; else y<=TA2; end if;
				when TEXTRA2=> y<=TB2;
				when TB2=> if noCambio='0' then y<=TC2; else y<=TD2; end if;
				when TC2=> y<=TEXTRA2;
				when TD2=> if Uno='1' then y<=TEXTRA; else y<=TE2; end if;
				when TEXTRA=> y<=TE2;
				when TE2=> y<=TF2;
				when TF2=> if nueve='1' then y<=TG2; else y<=TB2; end if;
				when TG2=> if alMenosCuatro='0' then y<=TC2; else y<=TH2; end if;
				when TH2=> if verificacion='0' then y<=TI2; else y<=TJ2; end if;
				when TI2=> if ninguno='1' then y<=TJ2; else y<=TH2; end if;
				when TJ2=> if noCambio='1' then y<=TK2; else y<=TA2; end if;
				when TK2=> if ingreso='1' then y<=TAL1; else y<=TJ2; end if;
				
				-- INGRESO DE DATOS DEL PACIENTE A LA RAM (ESTADOS)
				when TAL1=> if listoIngreso='1' then y<=TAM1; else y<=TAL1; end if;
				when TAM1=> if ledCovid='1' then y<=TM2; else y<=TL2; end if;
				
				-- ENCENDIDO DE LED DE ENFERMEDAD (ESTADOS)
				when TL2=> if ledResfriado='1' then y<=TN2; else y<= TO2; end if;
				when TM2=> if listoTreinta='1' then y<=TR2; else y<=TM2; end if;
				when TN2=> if listoTreinta='1' then y<=TR2; else y<=TN2; end if;
				when TO2=> if ledGripe='1' then y<=TP2; else y<=TQ2; end if;
				when TP2=> if listoTreinta='1' then y<=TR2; else y<=TP2; end if;
				when TQ2=> y<=TS2;
				when TR2=> y<=TAN1;
				
				-- PRESENTACION DE MEDICAMENTOS (ESTADOS)
				when TAN1=> if cambioDiez='1' then y<=TAO1; else y<=TAN1; end if;
				when TAO1=> if cambioDiez='1' then y<=TAP1; else y<=TAO1; end if;
				when TAP1=> if cambioDiez='1' then y<=TAQ1; else y<=TAP1; end if;
				when TAQ1=> if cambioDiez='1' then y<=TS2; else y<=TAQ1; end if;---CAMBIAR
				
				-- MODO DE ESPERA (ESTADOS)
				when TS2=> if boton='1' then y<=TV2; else y<=TT2; end if;
				when TT2=> if or_10='1' then y<=TD1; else y<=TU2; end if;
				when TU2=> if start ='1' then y<=TS2; else y<=TA1; end if;
						
				-- MATRIZ (ESTADOS)
				when TV2=> y<=TX2;
				when TX2=> if alMenosCuatro='1' then y<=TZ2; else y<=TY2; end if;
				when TY2=> y<=TX2;
				when TZ2=> y<=TAA2;
				when TAA2=> y<=TAB2;
				when TAB2=> y<=TAC2;
				when TAC2=> if listoRecorridoMux='1' then y<=TAE2; else y<=TAQ2;end if;
				
				when TAQ2=> if esCovid='1' then y<= TAR2; else y<= TAS2; end if;
				when TAR2=> y<=TAC2;
				when TAS2=> if esResfriado='1' then y<= TAT2; else y<= TAU2; end if;
				when TAT2=> y<=TAC2;
				when TAU2=> if esGripe='1' then y<= TAV2; else y<= TAX2; end if;
				when TAV2=> y<=TAC2;
				when TAX2=> Y<=TAC2;
				
				when TAE2=> if sgteVuelta='1' then y<=TAF2; else y<=TAL2; end if;
				when TAF2=> if desplazamientoCompleto='1' then y<=TAK2; else y<= TAG2; end if;
				when TAG2=> if listoCambios='1' then y<=TAH2; else y<=TAI2; end if;
				when TAH2=> y<=TAJ2;
				when TAI2=> y<=TAJ2;
				when TAJ2=> y<=TAC2;
				when TAK2=> if completo='1' then y<=TAP2; else y<= TAN2; end if;
				when TAL2=> y<=TAB2;
				when TAN2=> if despCompleto='1' then y<=TAO2; else y<=TAN2; end if;
				when TAO2=> y<=TAA2;
				when TAP2=> if termina='1' then y<=TT2; else y<=TV2; end if;
				
				
				
				when others => y<=TA1;
 			end case;
		end if;
	end process;
	
	process(y,ingreso,vacio,noCambio,Uno,alMenosCuatro,nueve,verificacion,ninguno,despCompleto,completo,cambioDiez,termina,boton,listoCambios,listoIngreso)
	begin
	--parte 1
	enD1<='0';ldD1<='0';enCI<='0';enCIT<='0';ldCIT<='0';enC1<='0';ldC1<='0';borrando<='0';enC2<='0'; ldC2<='0';enP<='0';enPT<='0';ldPT<='0';enA<='0';enAT<='0';ldAT<='0';enE<='0';enET<='0';ldET<='0';
	accion<='0';enIngreso<='0';ldIngreso<='0';enAdd<='0';ldAdd<='0';
	enSgteM<='0';ldSgteM<='0';en10Segundos<='0';ld10Segundos<='0';ledAmarillo<='0';ledBlanco<='0';ledNaranja<='0';ledRosa<='0';
	
	--parte 2
	enActual<='0';enNueve<='0';ldNueve<='0';enUnoCant<='0';enDesUno<='0';enV<='0';enEnfermedad<='0';ldDesUno<='0';ldUnoCant<='0';
	ldV<='0';
	en30Segundos<='0';ld30Segundos<='0';ledC<='0';ledR<='0';ledG<='0';
	enPass2<='0';enPass<='0';ldPass<='0';ldPass2<='0';enAddressROM<='0';ldAddressROM<='0';
			enCont5<='0';ldCont5<='0';enCont14<='0'; enContRecorrido<='0';ldContRecorrido<='0';
			onOff<='0';enCol<='0';ldCont14<='0';enDatosListos<='0';ldDatosListos<='0';ldCol<='0'; WR<='0'; en10Datos<='0';
			enC5<='0';ldC5<='0';
		case y is
			-- INGRESO DE DATOS DEL PACIENTE (SALIDAS)
			when TB1=> enD1<='1';ldD1<='1';
			when TD1=> enCI<='1';
			when TE1=> if despCompleto='0' then enCIT<='1'; else enC1<='1'; end if;
			when TF1=> enD1<='1';			
			when TI1=> if ingreso='1' then enC1<='1'; ldC1<='1';enC2<='1'; ldC2<='1';
						  else enC1<='0'; ldC1<='0';enC2<='0'; ldC2<='0'; end if;
			when TJ1=> enCIT<='1';ldCIT<='1';enC1<='1';ldC1<='1';
						  
			when TK1=> enD1<='1';ldD1<='1';
			when TM1=> enP<='1';
			when TN1=> if despCompleto='0' then enPT<='1'; else enC2<='1'; end if;
			when TO1=> enD1<='1';			
			when TR1=> if ingreso='1' then enC2<='1'; ldC2<='1';
						  else enC2<='0'; ldC2<='0'; end if;
			when TS1=> enPT<='1';ldPT<='1';enC2<='1'; ldC2<='1';
			
			when TT1=> enD1<='1';ldD1<='1';
			when TV1=> enA<='1';
			when TW1=> if despCompleto='0' then enAT<='1'; else enC2<='1'; end if;
			when TX1=> enD1<='1';			
			when TAA1=> if ingreso='1' then enC2<='1'; ldC2<='1';
						  else enC2<='0'; ldC2<='0'; end if;
			when TAB1=> enAT<='1';ldAT<='1';enC2<='1'; ldC2<='1';
			
			when TAC1=> enD1<='1';ldD1<='1';
			when TAE1=> enE<='1';
			when TAF1=> if despCompleto='0' then enET<='1'; else enC2<='1'; end if;
			when TAG1=> enD1<='1';			
			when TAJ1=> if ingreso='1' then enC2<='1'; ldC2<='1';enD1<='1';ldD1<='1';
						  else enC2<='0'; ldC2<='0'; end if;
			when TAK1=> enET<='1';ldET<='1';enC2<='1'; ldC2<='1';
			
			-- INGRESO DE SINTOMAS Y DETERMINACION DE ENFERMEDAD (SALIDAS)
			when TEXTRA2=> enDesUno<='1'; ldDesUno<='1';
			when TB2=> if noCambio='0' then enActual<='1'; else enActual<='0'; end if;
			when TC2=> enNueve<='1';ldNueve<='1';enUnoCant<='1';ldUnoCant<='1';enActual<='1';
			when TEXTRA=>  enUnoCant<='1';
			when TE2=> enDesUno<='1';
			when TF2=> enNueve<='1';
			when TI2=> if ninguno='1' then enV<='0'; else enV<='1'; end if;
			when TJ2=> enEnfermedad<='1';
			
			-- INGRESO DE DATOS DEL PACIENTE A LA RAM (SALIDAS)
			when TAL1=> accion<='1'; if listoIngreso='1' then enIngreso<='1';ldIngreso<='1'; else enIngreso<='1';enAdd<='1'; end if;
			
			-- ENCENDIDO DE LED DE ENFERMEDAD (SALIDAS)
			when TM2=> en30Segundos<='1';ledC<='1';
			when TN2=> en30Segundos<='1';ledR<='1';
			when TP2=> en30Segundos<='1';ledG<='1';
			when TR2=> en30Segundos<='1';ld30Segundos<='1';enSgteM<='1';
			
			-- PRESENTACION DE MEDICAMENTOS (SALIDAS)
			when TAN1=> en10Segundos<='1';ledAmarillo<='1'; if cambioDiez='1' then enSgteM<='1';en10Segundos<='1';ld10Segundos<='1';
																		  end if;
			when TAO1=> en10Segundos<='1';ledBlanco<='1'; if cambioDiez='1' then enSgteM<='1';en10Segundos<='1';ld10Segundos<='1';
																		  end if;
			when TAP1=> en10Segundos<='1';ledNaranja<='1'; if cambioDiez='1' then enSgteM<='1';en10Segundos<='1';ld10Segundos<='1';
																		  end if;
			when TAQ1=> en10Segundos<='1';ledRosa<='1'; if cambioDiez='1' then enSgteM<='1';ldSgteM<='1';en10Segundos<='1';ld10Segundos<='1';
																		  end if;															  
			
			-- MODO DE ESPERA (SALIDAS) no hay
			
			-- MODO LECTURA DE REGISTROS
			when TS2=> if boton='1' then en10Datos<='1';ld10Datos<='1';enUnoCant<='1';ldUnoCant<='1'; end if;
			
			when TV2=> enPass2<='1';WR<='1';
			when TY2=> enUnoCant<='1'; en10Datos<='1';
			when TZ2=> enPass<='1';ldPass<='1';enUnoCant<='1';ldUnoCant<='1';WR<='1';
			when TAA2=> enAddressROM<='1';ldAddressROM<='1';enCol<='1'; ldCol<='1';
			when TAB2=> enCont5<='1';ldCont5<='1';
			when TAF2=> enCont14<='1'; 
			
			when TAH2=> enCol<='1';
			when TAI2=> enCol<='1';onOff<='1';enC5<='1';
			when TAJ2=> enAddressROM<='1';enContRecorrido<='1';ldContRecorrido<='1';
			when TAK2=> enC1<='1'; enCont14<='1';ldCont14<='1';enCol<='1';ldCol<='1';enC5<='1';ldC5<='1';
			when TAL2=> enContRecorrido<='1';
			when TAN2=> enD1<='1';enPass<='1';
			when TAO2=> enD1<='1';ldD1<='1';
			when TAP2=> enC1<='1'; ldC1<='1'; en10Datos<='1';enDatosListos<='1'; if termina='1' then 
							enD1<='1'; ldD1<='1';en10Segundos<='1';ld10Segundos<='1';enDatosListos<='1';ldDatosListos<='1';enPass2<='1';ldPass2<='1';end if;
			
			when TAR2=> enCont5<='1'; ledC<='1';
			when TAT2=> enCont5<='1'; ledR<='1';
			when TAV2=> enCont5<='1'; ledG<='1';
			when TAX2=> enCont5<='1';
			when others=> 
			--parte 1
			enD1<='0';ldD1<='0';enCI<='0';enCIT<='0';ldCIT<='0';enC1<='0';ldC1<='0';borrando<='0';enC2<='0'; ldC2<='0';enP<='0';enPT<='0';ldPT<='0';enA<='0';enAT<='0';ldAT<='0';enE<='0';enET<='0';ldET<='0';
			accion<='0';enIngreso<='0';ldIngreso<='0';enAdd<='0';ldAdd<='0';
			enSgteM<='0';ldSgteM<='0';en10Segundos<='0';ld10Segundos<='0';ledAmarillo<='0';ledBlanco<='0';ledNaranja<='0';ledRosa<='0';
			
			--parte 2
			enActual<='0';enNueve<='0';ldNueve<='0';enUnoCant<='0';enDesUno<='0';enV<='0';enEnfermedad<='0';ldDesUno<='0';
			ldUnoCant<='0';ldV<='0'; 
			en30Segundos<='0';ld30Segundos<='0';ledC<='0';ledR<='0';ledG<='0';
			enPass2<='0';enPass<='0';ldPass<='0';ldPass2<='0';enAddressROM<='0';ldAddressROM<='0';
			enCont5<='0';ldCont5<='0';enCont14<='0'; enContRecorrido<='0';ldContRecorrido<='0';
			onOff<='0';enCol<='0';ldCont14<='0';enDatosListos<='0';ldDatosListos<='0';ldCol<='0';WR<='0';
			en10Datos<='0';enC5<='0';ldC5<='0';
			
		end case;
	end process;
end sol;
				