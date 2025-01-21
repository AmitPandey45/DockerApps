û

sD:\MY SOFTWARE AND FILES\MY-PROJECT-AND-LEARNING\MyProjects\DockerApps\Common\Learning.Common.Api\ResponseMethod.cs
	namespace 	
Learning
 
. 
Common 
. 
Api 
{ 
public 

class 
ResponseMethod 
{ 
public 
static 
T 
HttpResponseResult *
<* +
T+ ,
>, -
(- .
IActionResult. ;
actionResult< H
)H I
{		 	
T 
response 
= 
default  
(  !
T! "
)" #
;# $
if 
( 
actionResult 
is 
ContentResult  -
contentResult. ;
); <
{ 
string 
content 
=  
contentResult! .
.. /
Content/ 6
;6 7
response 
= 
JsonConvert &
.& '
DeserializeObject' 8
<8 9
T9 :
>: ;
(; <
content< C
)C D
;D E
} 
return 
response 
; 
} 	
} 
} ò	
ëD:\MY SOFTWARE AND FILES\MY-PROJECT-AND-LEARNING\MyProjects\DockerApps\Common\Learning.Common.Api\Extensions\CommonServiceCollectionExtensions.cs
	namespace 	
Learning
 
. 
Common 
. 
Api 
. 

Extensions (
{ 
public 

static 
class -
!CommonServiceCollectionExtensions 9
{ 
public 
static 
IServiceCollection ()
AddHttpContextAccessorService) F
(F G
thisG K
IServiceCollectionL ^
services_ g
)g h
{ 	
services 
. "
AddHttpContextAccessor +
(+ ,
), -
;- .
return 
services 
; 
}		 	
public 
static 
IServiceCollection ( 
AddCommonAPIServices) =
(= >
this> B
IServiceCollectionC U
servicesV ^
)^ _
{ 	
return 
services 
; 
} 	
} 
} ëÑ
sD:\MY SOFTWARE AND FILES\MY-PROJECT-AND-LEARNING\MyProjects\DockerApps\Common\Learning.Common.Api\BaseController.cs
	namespace 	
Learning
 
. 
Common 
. 
Api 
{		 
public

 

abstract

 
class

 
BaseController

 (
:

) *
ControllerBase

+ 9
{ 
private  
IHttpContextAccessor $
_contextAccessor% 5
;5 6
private 
const 
string 
ApplicationJsonType 0
=1 2
$str3 E
;E F
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
CurrentUserName %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
ClientIp 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
IsTestUserRequest %
{& '
get( +
;+ ,
private- 4
set5 8
;8 9
}: ;
public 
BaseController 
(  
IHttpContextAccessor 2
contextAccessor3 B
)B C
{ 	
this 
. 
_contextAccessor !
=" #
contextAccessor$ 3
;3 4
GetDataFromHeader 
( 
_contextAccessor .
.. /
HttpContext/ :
): ;
;; <
} 	
	protected&& 
(&& 
string&& 
errorMessage&& &
,&&& '
string&&( .
	errorCode&&/ 8
)&&8 9
GetErrorMessage&&: I
(&&I J
)&&J K
{'' 	
var(( 
message(( 
=(( 
string((  
.((  !
Empty((! &
;((& '
var)) 
	errorCode)) 
=)) 
string)) "
.))" #
Empty))# (
;))( )
foreach** 
(** 
var** 
modelStateKey** &
in**' )
this*** .
.**. /

ModelState**/ 9
.**9 :
Keys**: >
)**> ?
{++ 
var,, 
modelStateVal,, !
=,," #
this,,$ (
.,,( )

ModelState,,) 3
[,,3 4
modelStateKey,,4 A
],,A B
;,,B C
foreach-- 
(-- 
var-- 
error-- "
in--# %
modelStateVal--& 3
.--3 4
Errors--4 :
)--: ;
{.. 
var// 
	exmessage// !
=//" #
string//$ *
.//* +
Empty//+ 0
;//0 1
var00 
excode00 
=00  
string00! '
.00' (
Empty00( -
;00- .
if11 
(11 
error11 
.11 
	Exception11 '
==11( *
null11+ /
)11/ 0
{22 
	exmessage33 !
=33" #
error33$ )
.33) *
ErrorMessage33* 6
;336 7
if44 
(44 
	exmessage44 %
.44% &
Split44& +
(44+ ,
$char44, /
)44/ 0
.440 1
Length441 7
>448 9
$num44: ;
)44; <
{55 
excode66 "
=66# $
	exmessage66% .
.66. /
Split66/ 4
(664 5
$char665 8
)668 9
[669 :
$num66: ;
]66; <
;66< =
	exmessage77 %
=77& '
	exmessage77( 1
.771 2
Split772 7
(777 8
$char778 ;
)77; <
[77< =
$num77= >
]77> ?
;77? @
}88 
else99 
{:: 
}<< 
	errorCode>> !
+=>>" $
excode>>% +
+>>, -
$str>>. 2
;>>2 3
message?? 
+=??  "
	exmessage??# ,
+??- .
$str??/ 6
;??6 7
}@@ 
elseAA 
{BB 
messageDD 
=DD  !
$strDD" 4
;DD4 5
	errorCodeEE !
=EE" #
$strEE$ *
;EE* +
}FF 
messageGG 
=GG 
messageGG %
.GG% &
TrimGG& *
(GG* +
)GG+ ,
.GG, -
EndsWithGG- 5
(GG5 6
$strGG6 <
)GG< =
?GG> ?
messageGG@ G
.GGG H
TrimGGH L
(GGL M
)GGM N
.GGN O
RemoveGGO U
(GGU V
messageGGV ]
.GG] ^
LengthGG^ d
-GGe f
$numGGg h
)GGh i
:GGj k
messageGGl s
;GGs t
	errorCodeHH 
=HH 
	errorCodeHH  )
.HH) *
TrimHH* .
(HH. /
)HH/ 0
.HH0 1
EndsWithHH1 9
(HH9 :
$strHH: =
)HH= >
?HH? @
	errorCodeHHA J
.HHJ K
TrimHHK O
(HHO P
)HHP Q
.HHQ R
RemoveHHR X
(HHX Y
	errorCodeHHY b
.HHb c
LengthHHc i
-HHj k
$numHHl m
)HHm n
:HHo p
	errorCodeHHq z
;HHz {
returnII 
(II 
messageII #
.II# $
TrimII$ (
(II( )
)II) *
,II* +
	errorCodeII, 5
)II5 6
;II6 7
}JJ 
}KK 
messageMM 
=MM 
messageMM 
.MM 
TrimMM "
(MM" #
)MM# $
.MM$ %
EndsWithMM% -
(MM- .
$strMM. 4
)MM4 5
?MM6 7
messageMM8 ?
.MM? @
TrimMM@ D
(MMD E
)MME F
.MMF G
RemoveMMG M
(MMM N
messageMMN U
.MMU V
LengthMMV \
-MM] ^
$numMM_ `
)MM` a
:MMb c
messageMMd k
;MMk l
	errorCodeNN 
=NN 
	errorCodeNN !
.NN! "
TrimNN" &
(NN& '
)NN' (
.NN( )
EndsWithNN) 1
(NN1 2
$strNN2 5
)NN5 6
?NN7 8
	errorCodeNN9 B
.NNB C
TrimNNC G
(NNG H
)NNH I
.NNI J
RemoveNNJ P
(NNP Q
	errorCodeNNQ Z
.NNZ [
LengthNN[ a
-NNb c
$numNNd e
)NNe f
:NNg h
	errorCodeNNi r
;NNr s
returnOO 
(OO 
messageOO 
.OO 
TrimOO  
(OO  !
)OO! "
,OO" #
	errorCodeOO$ -
)OO- .
;OO. /
}PP 	
privateRR 
voidRR 
GetDataFromHeaderRR &
(RR& '
HttpContextRR' 2
contextRR3 :
)RR: ;
{SS 	
ifTT 
(TT 
contextTT 
!=TT 
nullTT 
)TT  
{UU 
boolVV 

isTestModeVV 
;VV  
ifWW 
(WW 
contextWW 
.WW 
RequestWW #
.WW# $
HeadersWW$ +
.WW+ ,
TryGetValueWW, 7
(WW7 8
$strWW8 @
,WW@ A
outWWB E
varWWF I
userIdValuesWWJ V
)WWV W
&&WWX Z
userIdValuesWW[ g
.WWg h
CountWWh m
>WWn o
$numWWp q
)WWq r
{XX 
UserIdYY 
=YY 
ConvertYY $
.YY$ %
ToInt32YY% ,
(YY, -
userIdValuesYY- 9
[YY9 :
$numYY: ;
]YY; <
)YY< =
;YY= >
}ZZ 
if\\ 
(\\ 
context\\ 
.\\ 
Request\\ #
.\\# $
Headers\\$ +
.\\+ ,
TryGetValue\\, 7
(\\7 8
$str\\8 B
,\\B C
out\\D G
var\\H K
userNameValues\\L Z
)\\Z [
&&\\\ ^
userNameValues\\_ m
.\\m n
Count\\n s
>\\t u
$num\\v w
)\\w x
{]] 
CurrentUserName^^ #
=^^$ %
userNameValues^^& 4
[^^4 5
$num^^5 6
]^^6 7
;^^7 8
}__ 
ifaa 
(aa 
contextaa 
.aa 
Requestaa #
.aa# $
Headersaa$ +
.aa+ ,
TryGetValueaa, 7
(aa7 8
$straa8 B
,aaB C
outaaD G
varaaH K
clientIpValuesaaL Z
)aaZ [
&&aa\ ^
clientIpValuesaa_ m
.aam n
Countaan s
>aat u
$numaav w
)aaw x
{bb 
ClientIpcc 
=cc 
clientIpValuescc -
[cc- .
$numcc. /
]cc/ 0
;cc0 1
}dd 
ifff 
(ff 
contextff 
.ff 
Requestff #
.ff# $
Headersff$ +
.ff+ ,
TryGetValueff, 7
(ff7 8
$strff8 F
,ffF G
outffH K
varffL O
isTestModeValuesffP `
)ff` a
&&ffb d
isTestModeValuesffe u
.ffu v
Countffv {
>ff| }
$numff~ 
)	ff Ä
{gg 
Booleanhh 
.hh 
TryParsehh $
(hh$ %
isTestModeValueshh% 5
[hh5 6
$numhh6 7
]hh7 8
,hh8 9
outhh: =

isTestModehh> H
)hhH I
;hhI J
IsTestUserRequestii %
=ii& '

isTestModeii( 2
;ii2 3
}jj 
}kk 
}ll 	
	protectednn 
IActionResultnn 
BadRequestResponsenn  2
(nn2 3
stringnn3 9

methodnamenn: D
)nnD E
{oo 	
varpp 
errorResponsepp 
=pp 
newpp  #
BO_APIErrorResponsepp$ 7
(pp7 8
(pp8 9
intpp9 <
)pp< =
HttpStatusCodepp= K
.ppK L

BadRequestppL V
,ppV W

methodnameppX b
)ppb c
;ppc d
returnqq 
CreateResponseqq !
(qq! "
HttpStatusCodeqq" 0
.qq0 1

BadRequestqq1 ;
,qq; <
errorResponseqq= J
)qqJ K
;qqK L
}rr 	
	protectedtt 
IActionResulttt %
DefaultBadRequestResponsett  9
(tt9 :
stringtt: @

methodnamettA K
,ttK L
intttM P
codettQ U
=ttV W
$numttX [
,tt[ \
stringtt] c
messagettd k
=ttl m
$strttn |
)tt| }
{uu 	
varvv 
errorResponsevv 
=vv 
newvv  #
BO_APIErrorResponsevv$ 7
(vv7 8
codevv8 <
,vv< =

methodnamevv> H
,vvH I
messagevvJ Q
)vvQ R
;vvR S
returnww 
CreateResponseww !
(ww! "
HttpStatusCodeww" 0
.ww0 1

BadRequestww1 ;
,ww; <
errorResponseww= J
)wwJ K
;wwK L
}xx 	
	protectedzz 
IActionResultzz 
NotFoundResponsezz  0
(zz0 1
stringzz1 7

methodnamezz8 B
)zzB C
{{{ 	
var|| 
errorResponse|| 
=|| 
new||  #
BO_APIErrorResponse||$ 7
(||7 8
(||8 9
int||9 <
)||< =
HttpStatusCode||= K
.||K L
NotFound||L T
,||T U

methodname||V `
)||` a
;||a b
return}} 
CreateResponse}} !
(}}! "
HttpStatusCode}}" 0
.}}0 1
NotFound}}1 9
,}}9 :
errorResponse}}; H
)}}H I
;}}I J
}~~ 	
	protected
ÄÄ 
IActionResult
ÄÄ 
NoContentResponse
ÄÄ  1
<
ÄÄ1 2
T
ÄÄ2 3
>
ÄÄ3 4
(
ÄÄ4 5
string
ÄÄ5 ;

methodname
ÄÄ< F
,
ÄÄF G
T
ÄÄH I
response
ÄÄJ R
)
ÄÄR S
{
ÅÅ 	
var
ÇÇ 
successResponse
ÇÇ 
=
ÇÇ  !
new
ÇÇ" %
BO_APIResponse
ÇÇ& 4
<
ÇÇ4 5
T
ÇÇ5 6
>
ÇÇ6 7
(
ÇÇ7 8
(
ÇÇ8 9
int
ÇÇ9 <
)
ÇÇ< =
HttpStatusCode
ÇÇ= K
.
ÇÇK L
	NoContent
ÇÇL U
,
ÇÇU V

methodname
ÇÇW a
,
ÇÇa b'
CustomerValidationMessage
ÇÇc |
.
ÇÇ| } 
StatusCodeMessageÇÇ} é
[ÇÇé è
(ÇÇè ê
intÇÇê ì
)ÇÇì î
HttpStatusCodeÇÇî ¢
.ÇÇ¢ £
	NoContentÇÇ£ ¨
]ÇÇ¨ ≠
,ÇÇ≠ Æ
responseÇÇØ ∑
)ÇÇ∑ ∏
;ÇÇ∏ π
var
ÑÑ 
options
ÑÑ 
=
ÑÑ 
new
ÑÑ #
JsonSerializerOptions
ÑÑ 3
{
ÖÖ "
PropertyNamingPolicy
ÜÜ $
=
ÜÜ% &
null
ÜÜ' +
}
áá 
;
áá 
var
ââ 
json
ââ 
=
ââ 
System
ââ 
.
ââ 
Text
ââ "
.
ââ" #
Json
ââ# '
.
ââ' (
JsonSerializer
ââ( 6
.
ââ6 7
	Serialize
ââ7 @
(
ââ@ A
successResponse
ââA P
,
ââP Q
options
ââR Y
)
ââY Z
;
ââZ [
return
ãã 
Content
ãã 
(
ãã 
json
ãã 
,
ãã  !
ApplicationJsonType
ãã! 4
)
ãã4 5
;
ãã5 6
}
åå 	
	protected
éé 
IActionResult
éé &
DefaultNoContentResponse
éé  8
(
éé8 9
)
éé9 :
{
èè 	
return
êê 
	NoContent
êê 
(
êê 
)
êê 
;
êê 
}
ëë 	
	protected
ìì 
IActionResult
ìì 

OkResponse
ìì  *
<
ìì* +
T
ìì+ ,
>
ìì, -
(
ìì- .
string
ìì. 4

methodname
ìì5 ?
,
ìì? @
List
ììA E
<
ììE F
T
ììF G
>
ììG H
results
ììI P
)
ììP Q
{
îî 	
var
ïï 
successResponse
ïï 
=
ïï  !
new
ïï" %
BO_APIResponse
ïï& 4
<
ïï4 5
List
ïï5 9
<
ïï9 :
T
ïï: ;
>
ïï; <
>
ïï< =
(
ïï= >
(
ïï> ?
int
ïï? B
)
ïïB C
HttpStatusCode
ïïC Q
.
ïïQ R
OK
ïïR T
,
ïïT U

methodname
ïïV `
,
ïï` a
results
ïïb i
)
ïïi j
;
ïïj k
return
ññ 
CreateResponse
ññ !
(
ññ! "
HttpStatusCode
ññ" 0
.
ññ0 1
OK
ññ1 3
,
ññ3 4
successResponse
ññ5 D
)
ññD E
;
ññE F
}
óó 	
	protected
ôô 
IActionResult
ôô 
CreateResponse
ôô  .
<
ôô. /
T
ôô/ 0
>
ôô0 1
(
ôô1 2
HttpStatusCode
ôô2 @
code
ôôA E
,
ôôE F
T
ôôG H
response
ôôI Q
)
ôôQ R
{
öö 	
var
õõ 
settings
õõ 
=
õõ 
new
õõ $
JsonSerializerSettings
õõ 5
{
úú 
ContractResolver
ùù  
=
ùù! "
new
ùù# &%
DefaultContractResolver
ùù' >
(
ùù> ?
)
ùù? @
}
ûû 
;
ûû 
var
üü 
camelCaseLoad
üü 
=
üü 
JsonConvert
üü  +
.
üü+ ,
SerializeObject
üü, ;
(
üü; <
response
üü< D
,
üüD E
settings
üüF N
)
üüN O
;
üüO P
return
°° 
new
°° 
ContentResult
°° $
{
¢¢ 
Content
££ 
=
££ 
camelCaseLoad
££ '
,
££' (
ContentType
§§ 
=
§§ !
ApplicationJsonType
§§ 1
,
§§1 2

StatusCode
•• 
=
•• 
(
•• 
int
•• !
)
••! "
code
••" &
}
¶¶ 
;
¶¶ 
}
ßß 	
	protected
®® 
new
®® 
IActionResult
®® #
Ok
®®$ &
(
®®& '
object
®®' -
value
®®. 3
)
®®3 4
{
©© 	
return
™™ 
this
™™ 
.
™™ 
CreateResponse
™™ &
(
™™& '
HttpStatusCode
™™' 5
.
™™5 6
OK
™™6 8
,
™™8 9
value
™™: ?
)
™™? @
;
™™@ A
}
´´ 	
}
¨¨ 
}≠≠ 