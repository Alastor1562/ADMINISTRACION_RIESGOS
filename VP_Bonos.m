clear all; close all; clc;

yield = 0.0914;
cupon = 0.08;
valuation_day = '12-feb-2026';
expiration_day = '07-nov-2047';

price = bndprice(yield, cupon, valuation_day, expiration_day, 'Basis',2) 
PV01 = bndprice(yield - 0.0001, cupon, valuation_day, expiration_day, 'Basis',2)
