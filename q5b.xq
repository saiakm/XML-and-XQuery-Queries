for $x in doc('db/books.xml')//book
order by $x/rating descending
group by  $n:=$x/category
return ($x[1]/title,$x[1]/rating,$x[1]/category)
