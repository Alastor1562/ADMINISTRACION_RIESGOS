clear all; close all; clc;

%% Cargar datos
load SpecificYields.mat

%% Convertir yields de texto a número
SpecificYields.x5Y  = str2double(SpecificYields.x5Y)  / 100;
SpecificYields.x10Y = str2double(SpecificYields.x10Y) / 100;
SpecificYields.x20Y = str2double(SpecificYields.x20Y) / 100;

%% Convertir fecha a datetime
SpecificYields.Date = datetime(SpecificYields.Date,'InputFormat','dd/MM/yyyy');

%% Inicializar vectores
precio_5Y  = zeros(height(SpecificYields),1);
precio_10Y = zeros(height(SpecificYields),1);
precio_20Y = zeros(height(SpecificYields),1);

%% Loop principal usando bndprice
for i = 1:height(SpecificYields)

    settlement = SpecificYields.Date(i);

    % ===== Precio usando yield 5Y =====
    precio_5Y(i) = bndprice( ...
        SpecificYields.x5Y(i), ...
        0.0775, ...
        settlement, ...
        '29-may-2031', ...
        'Basis', 2);

    % ===== Precio usando yield 10Y =====
    precio_10Y(i) = bndprice( ...
        SpecificYields.x10Y(i), ...
        0.1, ...
        settlement, ...
        '20-nov-2036', ...
        'Basis', 2);

    % ===== Precio usando yield 20Y =====
    precio_20Y(i) = bndprice( ...
        SpecificYields.x20Y(i), ...
        0.08, ...
        settlement, ...
        '07-nov-2047', ...
        'Basis', 2);

end

%% Agregar columnas nuevas
SpecificYields.Precio_5Y  = precio_5Y;
SpecificYields.Precio_10Y = precio_10Y;
SpecificYields.Precio_20Y = precio_20Y;

%% Exportar Excel
writetable(SpecificYields,'Precios_Bonos.xlsx')

disp('Excel generado correctamente usando bndprice.')
