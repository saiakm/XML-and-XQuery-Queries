for $x in doc('db/books.xml')//book
order by xs:integer($x/price)
group by  $n:=$x/category
return ($x[1]/title,$x[1]/price,$x[1]/category)
