clear all; close all; clc;

yield = 0.0864;
cupon = 0.08;
valuation_day = '27-feb-2026';
expiration_day = '21-feb-2036';

price = bndprice(yield, cupon, valuation_day, expiration_day, 'Basis',2) 
PV01 = bndprice(yield - 0.0001, cupon, valuation_day, expiration_day, 'Basis',2)
