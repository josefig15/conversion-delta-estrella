# PROGRAMA PARA CONVERTIR ARREGLO DE RESISTENCIAS EN DELTA A ESTRELLA Y VISCEVERSA.
# COMO USAR:
# SE INGRESA LOS DATOS EN VECTOR L1
# L1 = [ RA , RB , RC ] ARREGLO EN DELTA.
# L1 = [ R1 , R2 , R3 ] ARREGLO EN ESTRELLA.

# CONVERSION DELTA - ESTRELLA

#                 				 _ _ _ _ _RB_ _ _ _ _  
#	          / \		        \ *	                * /
#	         / * \	         \  *             *  /							
#	        /  *  \	          \   *         *   /				
#	       /   *   \           \    R1    R2   /  
#	      /    R3   \           RA    * *     RC		
#	     RA    *    RC           \     *     /
#	    /     * *     \           \    R3   /  
#	   /    R1    R2   \           \   *   /
#	  /   *         *   \           \  *  /
#	 /  *             *  \           \ * /
#	/_*_ _ _ _ RB_ _ _ _*_\           \ /

  disp("CONVERTIDOR DY YD")
  disp("1)D->Y")
  disp("2)Y->D")
  input("Opcion? ")
  O = ans;
  
  if O == 1
    disp("L1 = RA,RB,RC")  
  else
    disp("L1 = R1,R2,R3")
  endif

  % Creacion vectores de trabajo.
  L1 = zeros(1,3);  % Vector de ingreso de datos.
  L2 = zeros(1,3);  % Vector de salida  de datos.
  
  % Proceso ingreso de rsistencias.
  for N = 1:3
    input("R? ")
    L1(N) = ans;
  endfor
  
  S = 0;            % Acumulador 
  
  for N = 1:3       % Recorre elementos de L1
    
    if O == 1                    % Cuando es D->Y
      S = S + L1(N);               % sumatoria todos los elementos.
    else                        % Cuando es Y->D
      if N < 3                    % sumatoria todos los productos.
        S = S + L1(N)*L1(N+1);    % Combinacioes R1,R2 y R2,R3
      else
        S = S + L1(N)*L1(1);      % Combinacioes R1,R3
      endif
    endif
    
  endfor
 
  for N = 1:3       % Recorre elementos de L1
      
    if N<3
      if O == 1                   % Cuando es D->Y
        L2(N) = L1(N)*L1(N+1)/S;    % Numerador RA,RB y RB,RC
      else                        % Cuando es Y->D
        L2(N) = S/L1(N+1);          % Denominador R2 y R3
      endif
    else
      if O == 1                   % Cuando es D->Y
        L2(N) = L1(N)*L1(1)/S       % Numerador RA,RC 
      else                        % Cuando es Y->D 
        L2(N) = S/L1(N)             % Denominador R1
      endif
    endif  
  endfor
  
  % PROCESO MOSTRAR RESLUTADOS
  disp("Resultado")
  if O == 1                         % Cuando es D->Y
    disp("L2 = R1,R2,R3 DELTA")   
    disp("R1 OPUESTA A RC")
    disp("R2 OPUESTA A RA")
    disp("R3 OPUESTA A RB")
  else                              % Cuando es Y->D
    disp("L2 = RA,RB,RC ESTRELLA")
    disp("RA ENTRE R1 Y R3")
    disp("RB ENTRE R1 Y R2")
    disp("RC ENTRE R3 Y R2")
  endif

  L2                                % Muestra vector resultado conversion. 