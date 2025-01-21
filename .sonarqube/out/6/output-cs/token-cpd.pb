†
qD:\MY SOFTWARE AND FILES\MY-PROJECT-AND-LEARNING\MyProjects\DockerApps\App\Learning.Docker.Api\WeatherForecast.cs
	namespace 	
Docker
 
. 
Api 
{ 
public 

class 
WeatherForecast  
{ 
public 
DateOnly 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
TemperatureC 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
int		 
TemperatureF		 
=>		  "
$num		# %
+		& '
(		( )
int		) ,
)		, -
(		- .
TemperatureC		. :
/		; <
$num		= C
)		C D
;		D E
public 
string 
? 
Summary 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ë>
qD:\MY SOFTWARE AND FILES\MY-PROJECT-AND-LEARNING\MyProjects\DockerApps\App\Learning.Docker.Api\Startup\Startup.cs
	namespace 	
DockerAppsDemo
 
. 
Startup  
{ 
public		 

static		 
class		 
Startup		 
{

 
public 
static 
( !
WebApplicationBuilder ,
builder- 4
,4 5
WebApplication6 D
appE H
)H I
StartAppJ R
(R S
stringS Y
[Y Z
]Z [
args\ `
)` a
{ 	!
WebApplicationBuilder !
builder" )
=* +
WebApplication, :
.: ;
CreateBuilder; H
(H I
argsI M
)M N
;N O
IServiceCollection 
services '
=( )
ConfigureServices* ;
(; <
builder< C
,C D
argsE I
)I J
;J K
WebApplication 
app 
=  
ConfigureMiddleware! 4
(4 5
builder5 <
,< =
args> B
)B C
;C D
return 
( 
builder 
, 
app  
)  !
;! "
} 	
public 
static 
IServiceCollection (
ConfigureServices) :
(: ;!
WebApplicationBuilder; P
builderQ X
,X Y
stringZ `
[` a
]a b
argsc g
)g h
{ 	
IServiceCollection 
services '
=( )
builder* 1
.1 2
Services2 :
;: ;
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. #
AddEndpointsApiExplorer ,
(, -
)- .
;. /
SetupSwaggerService 
(  
services  (
)( )
;) *
services 
. 
AddApiVersioning %
(% &
options& -
=>. 0
{ 
options 
. 
ReportApiVersions )
=* +
true, 0
;0 1
options   
.   /
#AssumeDefaultVersionWhenUnspecified   ;
=  < =
true  > B
;  B C
options!! 
.!! 
DefaultApiVersion!! )
=!!* +
new!!, /

ApiVersion!!0 :
(!!: ;
$num!!; <
,!!< =
$num!!> ?
)!!? @
;!!@ A
options"" 
."" 
ApiVersionReader"" (
="") *
new""+ .&
UrlSegmentApiVersionReader""/ I
(""I J
)""J K
;""K L
}## 
)## 
;## 
services%% 
.&& )
AddHttpContextAccessorService&& .
(&&. /
)&&/ 0
.''  
AddCommonAPIServices'' %
(''% &
)''& '
;''' (
return)) 
services)) 
;)) 
}** 	
public,, 
static,, 
WebApplication,, $
ConfigureMiddleware,,% 8
(,,8 9!
WebApplicationBuilder,,9 N
builder,,O V
,,,V W
string,,X ^
[,,^ _
],,_ `
args,,a e
),,e f
{-- 	
WebApplication.. 
app.. 
=..  
builder..! (
...( )
Build..) .
(... /
)../ 0
;..0 1
app00 
.00 

UseRouting00 
(00 
)00 
;00 
app11 
.11 
UseHttpsRedirection11 #
(11# $
)11$ %
;11% &
app22 
.22 
UseAuthorization22  
(22  !
)22! "
;22" #
if55 
(55 
app55 
.55 
Environment55 
.55  
IsDevelopment55  -
(55- .
)55. /
)55/ 0
{66 "
SetupSwaggerMiddleware77 &
(77& '
app77' *
)77* +
;77+ ,
}88 
app:: 
.:: 
UseEndpoints:: 
(:: 
	endpoints:: &
=>::' )
{;; 
	endpoints<< 
.<< 
MapControllers<< (
(<<( )
)<<) *
;<<* +
}== 
)== 
;== 
return?? 
app?? 
;?? 
}@@ 	
privateBB 
staticBB 
voidBB 
SetupSwaggerServiceBB /
(BB/ 0
IServiceCollectionBB0 B
servicesBBC K
)BBK L
{CC 	
servicesDD 
.DD 
AddTransientDD !
<DD! "*
IApiVersionDescriptionProviderDD" @
,DD@ A0
$DefaultApiVersionDescriptionProviderDDB f
>DDf g
(DDg h
)DDh i
;DDi j
servicesFF 
.FF 
AddSwaggerGenFF "
(FF" #
cFF# $
=>FF% '
{GG 
cHH 
.HH 

SwaggerDocHH 
(HH 
$strHH !
,HH! "
newHH# &
OpenApiInfoHH' 2
{HH3 4
TitleHH5 :
=HH; <
$strHH= E
,HHE F
VersionHHG N
=HHO P
$strHHQ U
}HHV W
)HHW X
;HHX Y
cII 
.II 

SwaggerDocII 
(II 
$strII !
,II! "
newII# &
OpenApiInfoII' 2
{II3 4
TitleII5 :
=II; <
$strII= E
,IIE F
VersionIIG N
=IIO P
$strIIQ U
}IIV W
)IIW X
;IIX Y
cJJ 
.JJ 

SwaggerDocJJ 
(JJ 
$strJJ !
,JJ! "
newJJ# &
OpenApiInfoJJ' 2
{JJ3 4
TitleJJ5 :
=JJ; <
$strJJ= E
,JJE F
VersionJJG N
=JJO P
$strJJQ U
}JJV W
)JJW X
;JJX Y
cKK 
.KK %
ResolveConflictingActionsKK +
(KK+ ,
apiDescriptionsKK, ;
=>KK< >
apiDescriptionsKK? N
.KKN O
FirstKKO T
(KKT U
)KKU V
)KKV W
;KKW X
}LL 
)LL 
;LL 
}MM 	
privateOO 
staticOO 
voidOO "
SetupSwaggerMiddlewareOO 2
(OO2 3
WebApplicationOO3 A
appOOB E
)OOE F
{PP 	
appXX 
.XX 

UseSwaggerXX 
(XX 
)XX 
;XX 
appaa 
.aa 
UseSwaggerUIaa 
(aa 
caa 
=>aa !
{bb 
foreachcc 
(cc 
varcc 
descriptioncc (
incc) +
appcc, /
.cc/ 0
Servicescc0 8
.cc8 9
GetRequiredServicecc9 K
<ccK L*
IApiVersionDescriptionProviderccL j
>ccj k
(cck l
)ccl m
.ccm n#
ApiVersionDescriptions	ccn Ñ
)
ccÑ Ö
{dd 
cee 
.ee 
SwaggerEndpointee %
(ee% &
$"ee& (
$stree( 2
{ee2 3
descriptionee3 >
.ee> ?
	GroupNameee? H
.eeH I
SpliteeI N
(eeN O
$streeO R
)eeR S
[eeS T
$numeeT U
]eeU V
}eeV W
$streeW d
"eed e
,eee f
$"eeg i
$streei m
{eem n
descriptioneen y
.eey z
	GroupName	eez É
}
eeÉ Ñ
"
eeÑ Ö
)
eeÖ Ü
;
eeÜ á
}ff 
cgg 
.gg 
RoutePrefixgg 
=gg 
$strgg  )
;gg) *
}hh 
)hh 
;hh 
}qq 	
}rr 
}ss Á
qD:\MY SOFTWARE AND FILES\MY-PROJECT-AND-LEARNING\MyProjects\DockerApps\App\Learning.Docker.Api\Startup\Program.cs
( !
WebApplicationBuilder 
builder 
, 
WebApplication  .
app/ 2
)2 3
=4 5
Startup6 =
.= >
StartApp> F
(F G
argsG K
)K L
;L M
app 
. 
Run 
( 
) 	
;	 
›
áD:\MY SOFTWARE AND FILES\MY-PROJECT-AND-LEARNING\MyProjects\DockerApps\App\Learning.Docker.Api\Controllers\WeatherForecastController.cs
	namespace 	
Docker
 
. 
Api 
. 
Controllers  
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class %
WeatherForecastController *
:+ ,
BaseController- ;
{		 
private

 
static

 
readonly

 
string

  &
[

& '
]

' (
	Summaries

) 2
=

3 4
new

5 8
[

8 9
]

9 :
{ 	
$str 
, 
$str !
,! "
$str# +
,+ ,
$str- 3
,3 4
$str5 ;
,; <
$str= C
,C D
$strE L
,L M
$strN S
,S T
$strU a
,a b
$strc n
} 	
;	 

private 
readonly 
ILogger  
<  !%
WeatherForecastController! :
>: ;
_logger< C
;C D
public %
WeatherForecastController (
(( )
ILogger) 0
<0 1%
WeatherForecastController1 J
>J K
loggerL R
,R S 
IHttpContextAccessorT h
contextAccessori x
)x y
: 
base 
( 
contextAccessor "
)" #
{ 	
_logger 
= 
logger 
; 
} 	
[ 	
HttpGet	 
( 
Name 
= 
$str ,
), -
]- .
public 
IEnumerable 
< 
WeatherForecast *
>* +
Get, /
(/ 0
)0 1
{ 	
return 

Enumerable 
. 
Range #
(# $
$num$ %
,% &
$num' (
)( )
.) *
Select* 0
(0 1
index1 6
=>7 9
new: =
WeatherForecast> M
{ 
Date 
= 
DateOnly 
.  
FromDateTime  ,
(, -
DateTime- 5
.5 6
Now6 9
.9 :
AddDays: A
(A B
indexB G
)G H
)H I
,I J
TemperatureC 
= 
Random %
.% &
Shared& ,
., -
Next- 1
(1 2
-2 3
$num3 5
,5 6
$num7 9
)9 :
,: ;
Summary 
= 
	Summaries #
[# $
Random$ *
.* +
Shared+ 1
.1 2
Next2 6
(6 7
	Summaries7 @
.@ A
LengthA G
)G H
]H I
} 
) 
.   
ToArray   
(   
)   
;   
}!! 	
}"" 
}## √#
D:\MY SOFTWARE AND FILES\MY-PROJECT-AND-LEARNING\MyProjects\DockerApps\App\Learning.Docker.Api\Controllers\StudentController.cs
	namespace 	
DockerAppsDemo
 
. 
Controllers $
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 4
)4 5
]5 6
[		 

ApiVersion		 
(		 
$str		 
)		 
]		 
public

 

class

 
StudentController

 "
:

# $
BaseController

% 3
{ 
private 

Dictionary 
< 
int 
, 
string  &
>& '
students( 0
=1 2
new3 6

Dictionary7 A
<A B
intB E
,E F
stringG M
>M N
{ 	
{ 
$num 
, 
$str 
} 
, 
{ 
$num 
, 
$str 
} 
, 
{ 
$num 
, 
$str 
} 
, 
{ 
$num 
, 
$str 
} 
, 
{ 
$num 
, 
$str 
} 
, 
{ 
$num 
, 
$str 
} 
, 
{ 
$num 
, 
$str 
} 
, 
} 	
;	 

public 
StudentController  
(  ! 
IHttpContextAccessor! 5
contextAccessor6 E
)E F
: 
base 
( 
contextAccessor "
)" #
{ 	
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status200OK* 5
,5 6
Type7 ;
=< =
typeof> D
(D E

DictionaryE O
<O P
intP S
,S T
stringU [
>[ \
)\ ]
)] ^
]^ _
public 
IActionResult 
GetStudents (
(( )
)) *
{   	
var!! 
data!! 
=!! 
students!! 
.!!  
Select!!  &
(!!& '
s!!' (
=>!!) +
s!!, -
.!!- .
Value!!. 3
)!!3 4
.!!4 5
ToList!!5 ;
(!!; <
)!!< =
;!!= >
return"" 
this"" 
."" 
Ok"" 
("" 
new"" 
BO_APIResponse"" -
<""- .

Dictionary"". 8
<""8 9
int""9 <
,""< =
string""> D
>""D E
>""E F
(""F G
StatusCodes""G R
.""R S
Status200OK""S ^
,""^ _
$str""` m
,""m n
$str	""o Å
,
""Å Ç
students
""É ã
,
""ã å
true
""ç ë
,
""ë í
$str
""ì ú
)
""ú ù
)
""ù û
;
""û ü
}## 	
[%% 	
HttpGet%%	 
]%% 
[&& 	
Route&&	 
(&& 
$str&& 
)&& 
]&& 
['' 	 
ProducesResponseType''	 
('' 
StatusCodes'' )
.'') *
Status200OK''* 5
,''5 6
Type''7 ;
=''< =
typeof''> D
(''D E
string''E K
)''K L
)''L M
]''M N
public(( 
IActionResult(( 

GetStudent(( '
(((' (
int((( +
id((, .
)((. /
{)) 	
return** 
this** 
.** 
Ok** 
(** 
new** 
BO_APIResponse** -
<**- .
string**. 4
>**4 5
(**5 6
StatusCodes**6 A
.**A B
Status200OK**B M
,**M N
$str**O [
,**[ \
$str**] j
,**j k
students**l t
[**t u
id**u w
]**w x
,**x y
true**z ~
,**~ 
$str
**Ä â
)
**â ä
)
**ä ã
;
**ã å
}++ 	
},, 
}-- ‚
ÇD:\MY SOFTWARE AND FILES\MY-PROJECT-AND-LEARNING\MyProjects\DockerApps\App\Learning.Docker.Api\Controllers\ProductsV3Controller.cs
	namespace 	
DockerAppsDemo
 
. 
Controllers $
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 2
)2 3
]3 4
[ 

ApiVersion 
( 
$str 
) 
] 
public		 

class		  
ProductsV3Controller		 %
:		& '
BaseController		( 6
{

 
private 
readonly 

Dictionary #
<# $
int$ '
,' (
string) /
>/ 0
products1 9
=: ;
new< ?

Dictionary@ J
<J K
intK N
,N O
stringP V
>V W
{ 	
{ 
$num 
, 
$str 
}  
,  !
{ 
$num 
, 
$str 
}  
,  !
{ 
$num 
, 
$str 
}  
} 	
;	 

public  
ProductsV3Controller #
(# $ 
IHttpContextAccessor$ 8
contextAccessor9 H
)H I
: 
base 
( 
contextAccessor "
)" #
{ 	
} 	
[ 	
HttpGet	 
] 
[ 	 
ProducesResponseType	 
( 
$num !
,! "
Type# '
=( )
typeof* 0
(0 1
IEnumerable1 <
<< =
string= C
>C D
)D E
)E F
]F G
public 
IActionResult 
Get  
(  !
)! "
{ 	
return 
Ok 
( 
products 
. 
Select %
(% &
p& '
=>( *
p+ ,
., -
Value- 2
)2 3
)3 4
;4 5
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
[ 	 
ProducesResponseType	 
( 
$num !
,! "
Type# '
=( )
typeof* 0
(0 1
string1 7
)7 8
)8 9
]9 :
[   	 
ProducesResponseType  	 
(   
$num   !
)  ! "
]  " #
public!! 
IActionResult!! 
Get!!  
(!!  !
int!!! $
id!!% '
)!!' (
{"" 	
if## 
(## 
products## 
.## 
TryGetValue## $
(##$ %
id##% '
,##' (
out##) ,
string##- 3
product##4 ;
)##; <
)##< =
{$$ 
return%% 
Ok%% 
(%% 
product%% !
)%%! "
;%%" #
}&& 
return'' 
NotFound'' 
('' 
)'' 
;'' 
}(( 	
})) 
}** ˚
ÇD:\MY SOFTWARE AND FILES\MY-PROJECT-AND-LEARNING\MyProjects\DockerApps\App\Learning.Docker.Api\Controllers\ProductsV2Controller.cs
	namespace 	
DockerAppsDemo
 
. 
Controllers $
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 2
)2 3
]3 4
[ 

ApiVersion 
( 
$str 
) 
] 
[		 

ApiVersion		 
(		 
$str		 
)		 
]		 
public

 

class

  
ProductsV2Controller

 %
:

& '
BaseController

( 6
{ 
public  
ProductsV2Controller #
(# $ 
IHttpContextAccessor$ 8
contextAccessor9 H
)H I
: 
base 
( 
contextAccessor "
)" #
{ 	
} 	
[ 	
HttpGet	 
] 
[ 	
MapToApiVersion	 
( 
$str 
) 
]  
public 
IActionResult 
GetV1 "
(" #
)# $
{ 	
return 
Ok 
( 
$str 2
)2 3
;3 4
} 	
[ 	
HttpGet	 
] 
[ 	
MapToApiVersion	 
( 
$str 
) 
]  
public 
IActionResult 
GetV2 "
(" #
)# $
{ 	
return 
Ok 
( 
$str 2
)2 3
;3 4
} 	
}   
}"" ¶
ÄD:\MY SOFTWARE AND FILES\MY-PROJECT-AND-LEARNING\MyProjects\DockerApps\App\Learning.Docker.Api\Controllers\ProductsController.cs
	namespace 	
DockerAppsDemo
 
. 
Controllers $
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 4
)4 5
]5 6
[ 

ApiVersion 
( 
$str 
) 
] 
[		 

ApiVersion		 
(		 
$str		 
)		 
]		 
public

 

class

 
ProductsController

 #
:

$ %
BaseController

& 4
{ 
private 
readonly 

Dictionary #
<# $
int$ '
,' (
string) /
>/ 0
products1 9
=: ;
new< ?

Dictionary@ J
<J K
intK N
,N O
stringP V
>V W
{ 	
{ 
$num 
, 
$str 
} 
, 
{ 
$num 
, 
$str 
} 
, 
{ 
$num 
, 
$str 
} 
} 	
;	 

public 
ProductsController !
(! " 
IHttpContextAccessor" 6
contextAccessor7 F
)F G
: 
base 
( 
contextAccessor "
)" #
{ 	
} 	
[ 	
HttpGet	 
] 
[ 	 
ProducesResponseType	 
( 
$num !
,! "
Type# '
=( )
typeof* 0
(0 1
IEnumerable1 <
<< =
string= C
>C D
)D E
)E F
]F G
public 
IActionResult 
Get  
(  !
)! "
{ 	
return 
Ok 
( 
products 
. 
Select %
(% &
p& '
=>( *
p+ ,
., -
Value- 2
)2 3
)3 4
;4 5
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
[   	 
ProducesResponseType  	 
(   
StatusCodes   )
.  ) *
Status200OK  * 5
,  5 6
Type  7 ;
=  < =
typeof  > D
(  D E
string  E K
)  K L
)  L M
]  M N
[!! 	 
ProducesResponseType!!	 
(!! 
StatusCodes!! )
.!!) *
Status404NotFound!!* ;
)!!; <
]!!< =
public"" 
IActionResult"" 
Get""  
(""  !
int""! $
id""% '
)""' (
{## 	
if$$ 
($$ 
products$$ 
.$$ 
TryGetValue$$ $
($$$ %
id$$% '
,$$' (
out$$) ,
string$$- 3
product$$4 ;
)$$; <
)$$< =
{%% 
return&& 
Ok&& 
(&& 
product&& !
)&&! "
;&&" #
}'' 
return)) 
NotFound)) 
()) 
))) 
;)) 
}** 	
}++ 
},, 