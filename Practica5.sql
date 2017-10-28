select avg(monto) as 'promedio de ventas' , min (monto) as 'Pago minimo', max(monto_de_P) as 'monto de pago'
from  ventas, pagos

select monto
from ventas
where monto > 50

select cantidad
from inventario
where cantidad < 700

select sum(producto_cant) as 'ventas de hoy'
from ventas
having sum(producto_cant) > 1

select avg(monto) as 'promedio de compras' , avg(producto_cant) as 'promedio de productos por compra'
from ventas
having avg(monto) > 1

select top 2 * from cajero;

select count(idCajero) as 'Numero de empleados', sexo from cajero group by sexo;