clear all; close all; clc;

yield = 0.0824;
cupon = 0.085;
valuation_day = '13-may-2026';
expiration_day = '31-may-2029';

price = bndprice(yield, cupon, valuation_day, expiration_day, 'Basis',2) 
PV01 = bndprice(yield - 0.0001, cupon, valuation_day, expiration_day, 'Basis',2)
