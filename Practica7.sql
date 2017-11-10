create procedure mayor_inversion (@inversion int)
as
begin
	select * from dbo.SumInvent where Total_Por_Producto > @inversion
end
exec mayor_inversion @inversion = 50000


create procedure mayor_venta (@var1 int)
as 
begin
	select * from dbo.DetalleDeV where producto_cant > @var1
end
execute mayor_venta @var1 = 2

create procedure prodbar (@var2 int, @var3 int)
as
begin
	select * from dbo.InvenTo where cantidad < @var2 and PrecioProducto < @var3
end
execute prodbar @var2 = 2000, @var3 = 1000

create procedure tipopag (@tp varchar(10))
as
begin
	select * from dbo.PagoVen where Tipo_de_Pago = @tp and monto > 50
end
execute tipopag @tp = 'Efectivo'

create procedure prove (@prov varchar(20))
as
begin
	select * from dbo.ProdPro where Nombre_Proveedor = @prov
end
execute prove @prov = 'SONY'


create function fnabastecer (@actual int, @abastecimiento int)		-- verificara la cantidad de productos acutales en el primer valor y sumara 
returns int
as
begin
	RETURN  (@actual + @abastecimiento)
end

select dbo.fnabastecer (600, 200) "Newinventario"


create trigger Cambio_D_Inventario
on Inventario
after update 
as
begin
	select *
	from INSERTED
	select * 
	from DELETED
END

create trigger Prod
on producto
instead of insert
as
begin
	select nombre, precio, descripcion
	from inserted
end
