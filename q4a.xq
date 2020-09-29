let $books:= for $x in doc('db/books.xml')//book
order by  xs:integer($x/price)
group by $n:=$x/title
return $x[1]

for $x in $books

return ($x/title, $x/price)