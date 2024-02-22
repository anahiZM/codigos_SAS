/* Crear las bases de datos con la información del cliente y de las transacciones */
data cliente;
    input ID_cliente Nombre $ Apellido $ Edad Sexo $;
    datalines;
758362 Ana Montes 25 F
837213 Ignacio Rodriguez 30 M
372819 Olivia González 27 F
623158 Ivan Manriquez 32 M
723516 Sofia Nuñez 49 M
842618 Tania Martinez 25 F
732510 Ricardo Rodriguez 30 F
012173 Rodrigo Torres 27 M
536251 leila Montes 32 F
836189 Cristina Díaz 49 F
;
run;

data transacciones;
    input ID_cliente Número_de_Tarjeta Límite_de_credito $ Saldo Tipo_de_Tarjeta $;
    datalines;
758362 415291404567 50,000 25,000 Clásica
837213 415291404567 60,000 20,000 Oro
372819 415291404567 80,000 20,000 Clásica
623158 415291404567 70,000 30,000 Oro
723516 415291404567 90,000 35,000 Clásica
842618 415291404567 55,000 20,000 Oro
732510 415291404567 65,000 20,000 Clásica
012173 415291404567 95,000 25,000 Oro
536251 415291404567 86,000 20,000 Clásica
836189 415291404567 73,000 35,000 Clásica
;
run;

/* 2.1 Número de clientes que tienen más de $50,000 de límite de crédito y sean Mujeres */
proc sql;
    select count(*) as num_clientes_mujeres_mas_50000
    from cliente c
    inner join transacciones t on c.ID_cliente = t.ID_cliente
    where c.Sexo = 'F' and input(compress(t.Límite_de_credito, ','), best.) > 50000;
quit;

/* 2.2 Para cada Tipo de Tarjeta: el límite de crédito promedio y el saldo promedio */
proc sql;
    select Tipo_de_Tarjeta,
           mean(input(compress(Límite_de_credito, ','), best.)) as limite_credito_promedio,
           mean(Saldo) as saldo_promedio
    from transacciones
    group by Tipo_de_Tarjeta;
quit;