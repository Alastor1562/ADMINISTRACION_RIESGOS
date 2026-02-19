% jalar datos
bonos = readmatrix('EjemploFV.xlsx','Sheet','datos','Range','B2:D253');

yields_mar2029 = bonos(:,1)/100;
yields_nov2036 = bonos(:,2)/100;

fecha_valuacion = datetime(bonos(:,3),'ConvertFrom','excel');

precios_mar2029 = bndprice(yields_mar2029,.085,fecha_valuacion,'01-mar-2029','Basis',2);
precios_nov2036 = bndprice(yields_nov2036,.10,fecha_valuacion,'20-nov-2036','Basis',2);

valor_portafolio = precios_mar2029(end)*300000 + precios_nov2036(end)*100000;
