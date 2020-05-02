Use Chinook

--select name as thesquad
--from Artist
--where Name like 'A%'
--where ArtistId in (1,24,57,112)

----inner join
--select Artist.Name as ArtistName, Album.Title as AlbumName
--from Artist
--	left join Album
--		on Artist.ArtistId = Album.ArtistId


--select Album.*
--from Album
--join Artist
--on Album.ArtistId = Artist.ArtistId
--where Artist.Name like 'a%'

--select Album.*
--from Album
--	join Track
--	on Track.AlbumId = Album.AlbumId
--where Track.Name like 'b%';

--1. `non_usa_customers.sql`: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

--select FirstName, LastName, CustomerId, Country
--from Customer
-- where Country != 'USA'

--2. brazil_customers.sql: Provide a query only showing the Customers from Brazil.
--select FirstName, LastName,Country
--from Customer where Country = 'Brazil'


--3. `brazil_customers_invoices.sql`: Provide a query showing the Invoices of customers who are from Brazil. 
--The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
--select
--	Customer.FirstName, 
--	Customer.LastName,
--	InvoiceId,
--	Invoice.InvoiceDate,
--	Invoice.BillingCountry
--from Customer 
--inner Join Invoice on Customer.CustomerId = Invoice.CustomerId
--where BillingCountry like 'Brazil'

--4.--sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
--select LastName, FirstName, Title
--from Employee  
--where Title = 'Sales Support Agent'

--5. 
--unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
--select distinct BillingCountry
--from Invoice

-
--6.Provide a query that shows the invoices associated with each sales agent. 
--The resultant table should include the Sales Agent's full name.

--select * from Employee
select Employee.FirstName +  ' ' + Employee.LastName as Sales_Rep, InvoiceId as Invoice	
	from Employee
	join Customer on Customer.SupportRepId = Employee.EmployeeId
	join Invoice on  Invoice.CustomerId = Customer.CustomerId
where Employee.Title = 'Sales Support Agent'





--7.Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
select Total, CONCAT(Customer.FirstName, ' ', Customer.LastName) as 'Customer Name', Customer.Country,
CONCAT(Employee.FirstName, ' ', Employee.LastName) as 'Sales Agent Name'
from Invoice
join Customer on Customer.CustomerId = Invoice.CustomerId
join Employee on Employee.EmployeeId = Customer.SupportRepId



--8. How many Invoices were there in 2009 and 2011?
select COUNT (InvoiceDate) as 'Number of Invoices', YEAR(InvoiceDate)
from Invoice
where InvoiceDate between '01/01/2009' and '12/31/2009' 
group by YEAR(InvoiceDate)
union all
select COUNT (InvoiceDate) as 'Number of Invoices', YEAR(InvoiceDate)
from Invoice
where InvoiceDate between '01/01/2011' and '12/31/2011' 
group by YEAR(InvoiceDate)

--9. `total_sales_year.sql`: What are the respective total sales for each of those years?
select Sum(Total), Year(InvoiceDate)
from Invoice 
where YEAR(InvoiceDate)  = '2009'
group by YEAR(InvoiceDate)
union all
select Sum(Total), Year(InvoiceDate)
from Invoice
where Year(InvoiceDate) = '2011'
group by YEAR (InvoiceDate)


--10. `invoice_37_line_item_count.sql`: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
select count(*)
from InvoiceLine
where InvoiceId = '37'


--11. `line_items_per_invoice.sql`: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: [GROUP BY](https://docs.microsoft.com/en-us/sql/t-sql/queries/select-group-by-transact-sql)
select count(*), InvoiceId
from InvoiceLine
group by InvoiceId

--12. `line_item_track.sql`: Provide a query that includes 
--the purchased track name with each invoice line item.

select* 
from Track
 join InvoiceLine on InvoiceLine.TrackId = Track.TrackId 

--13. `line_item_track_artist.sql`: Provide a query that includes the purchased track name AND artist name with each invoice line item.
select Track.Name, Artist.Name, InvoiceLineId
from InvoiceLine 
	join Track on Track.TrackId = InvoiceLine.TrackId
	join Album on Album.AlbumId = Track.AlbumId	
	join Artist on Artist.ArtistId = Album.ArtistId
order by InvoiceLineId



--14. `country_invoices.sql`: Provide a query that shows the # of invoices per country.
--HINT: [GROUP BY](https://docs.microsoft.com/en-us/sql/t-sql/queries/select-group-by-transact-sql)
select count(*) ,BillingCountry
from Invoice
group by BillingCountry

--15. `playlists_track_count.sql`: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resultant table.
select Playlist.Name, Count(PlaylistTrack.TrackId) 
from Playlist 
	join PlaylistTrack on PlaylistTrack.PlaylistId = Playlist.PlaylistId
group by Playlist.Name

--Did that shit right no help!!!
--16. `tracks_no_id.sql`: Provide a query that shows all the Tracks, but displays no IDs. 
--The result should include the Album name, Media type and Genre.

select Track.Name, MediaType.Name, Genre.Name
from Track
	join MediaType on MediaType.MediaTypeId = Track.MediaTypeId
	join  Genre on Genre.GenreId = Track.MediaTypeId
--Wrong
--17. `invoices_line_item_count.sql`: Provide a query that shows 
--all Invoices but includes the # of invoice line items.
select Invoice.InvoiceId, InvoiceLine.InvoiceLineId
from Invoice
	join InvoiceLine on InvoiceLine.InvoiceId =Invoice.InvoiceId


--18. `sales_agent_total_sales.sql`: Provide a query that shows total sales made by each sales agent.





--19. `top_2009_agent.sql`: Which sales agent made the most in sales in 2009? HINT: [TOP](https://docs.microsoft.com/en-us/sql/t-sql/queries/top-transact-sql)
--20. `top_agent.sql`: Which sales agent made the most in sales over all?
--21. `sales_agent_customer_count.sql`: Provide a query that shows the count of customers assigned to each sales agent.
--22. `sales_per_country.sql`: Provide a query that shows the total sales per country.
--23. `top_country.sql`: Which country's customers spent the most?
--24. `top_2013_track.sql`: Provide a query that shows the most purchased track of 2013.
--25. `top_5_tracks.sql`: Provide a query that shows the top 5 most purchased songs.
--26. `top_3_artists.sql`: Provide a query that shows the top 3 best selling artists.
--27. `top_media_type.sql`: Provide a query that shows the most purchased Media Type.