syn match IJuliaCell			"^# %%\([^#]\|$\).*$"

highlight IJuliaCell        ctermfg=255 guifg=#eeeeee ctermbg=022 guibg=#005f00 cterm=bold gui=bold

" 对于已经定义的高亮，不能用 hi def link，只能用 hi link
hi link juliaFunctionCall juliaFunction

" Base
syntax keyword juliaFunction dot cross eigvecs eigen eigvals
syntax keyword juliaFunction abs abs2 abspath accept accumulate acos acosh acquire add add12 add22condh addenv adjoint afoldl aliasof alignment
syntax keyword juliaFunction all allocatedinline allowsmissing allunique andand angle any anymap apropos arch argextype argmax argmin argtail argtype arithmetictypes asF64 ascii asin asinh askey assertstring astname asyncmap atan atand atanh atexit atomictypes atreplinit axes axes1 axistype backtrace banner base36digits base62digits basename basetype bbidxiter beginsym between typeof
syntax keyword juliaFunction big bin bind bindingexpr binomial binpack binunpack bitcount bitreverse bitrotate bitstring bitsunionsize bodyfunction broadcast broadcastable broadcasted bswap byteenv bytes2hex bytesavailable callargs calldoc calloc canonicalize2 cat catdoc cbrt cconvert cdiv ceil check checkaxs checkbounds checkindex checkmode chmod chomp chop chown circshift cis cispi clamp 
syntax keyword juliaFunction cld close cmp coalesce codepoint codeunit codeunits collect compact compare compile compilecache 
syntax keyword juliaFunction complete complex 
syntax keyword juliaFunction containsnul conj 
" contains  是 Vim 关键字，用不了
syntax keyword juliaFunction contractuser convert copy copymutable copysign cos cosc cosd cosh cospi 
syntax keyword juliaFunction count countfrom countlines cptree cstr ctime cumprod cumsum cvt1 cwstring cycle dataids debuginfo dec decimallength decompose deepcopy defalg defined deg2rad denominator deprecate depwarn detach devnull diff diffrange digits dims2cat dims2string dirname display displayable
syntax keyword juliaFunction displays displaysize div div12 divgcd divrem dlclose dlext dllist dlopen dlpath dlsym doc docerror docexpr docm docstr doiterate dominated dominates dotgetproperty dottable dotview download drop dropdims dropwhile dst dump dumpbitcache dup eachcol eachindex eachline eachmatch eachrow eachslice elsize eltype eltypeof eltypes emphasize empty emptymutable enable endswith ensureroom enumerate eof eps errno error errormonitor esc eulergamma eval evalfile evalpoly eventloop exec exit exp exp10 exp2 expanduser expm1 exponent exprarray exprresolve exthorner extrema extrude factorial falses fastabs fdio fetch fieldcount fieldindex fieldname fieldnames fieldoffset fieldtypes filemode filesize fileurl fill filter finalize finalizer findall finddoc findfirst findfirstnot findlast findlastnot findmax findmeta findmetaarg findmin findnext findnextnot findprev findprevnot findsup finish first firstcaller firstindex flatten fld fld1 fldmod fldmod1 flipsign float floatmax floatmin floatrange floattype floattypes floor flush fma foldl
syntax keyword juliaFunction foldr foo foreach foreachssa formatdoc free frexp from fromfraction fromhighword front fullname functionloc futime gcd gcdext gcdx generateinversetables genperm gensym get getcapture getdoc geteuid getgrgid getgroupname gethostname getindex getkey getpass getpid getproperty getptls getpwuid getsym gettypeinfos getuid getusername global gmpz golden gperm graphemes hasfastin hasfield hasgenerator hash hashindex haskey haslength hasmethod hasproperty hastypemax hasuniquerep hcat heads hex hex2bytes hidigit highword homedir htol hton hvcat hvncat hypot icmp identity idf idiv ignorelimited ignorestatus imag inbase inc include indcopy indentation indexforexp indexin indexoffset inds2string inferencebarrier info initmeta inlineanonymous inner insorted instances instantiate intersect intoffset inttype inttypes inv invert invmod invokelatest invperm isType isabspath isabstracttype isambiguous isapple isapprox isascii isassigned isbadzero isbasicdoc isbetween isbinaryoperator isbindingresolved isbits isbitstype isbitsunion isblockdev isbsd isbuffered iscallexpr iscased ischardev ischunkedbroadcast iscntrl isconcretedispatch isconcretetype isconst isconstType iscontiguous isdelimited isdeprecated isdigit isdir isdirpath isdisjoint isdispatchelem isdispatchtuple isdone isdragonfly isempty isequal iseven isexecutable isexported isexpr isfield isfifo isfile isfinite isflat isfreebsd isgensym isgoodzero isgraphemebreak isgreater isidentifier isimmutable isinf isinlineable isinteger isinteractive isiterable isjsvm iskindtype isknownlength isknowntype isless isletter islink islinux islocked islowercase ismalformed ismarked ismissing ismodulecall ismount ismutable ismutabletype isnan isneg
syntax keyword juliaFunction isnetbsd isnewline isnotbrokensubtype isnothing isnumeric isodd isone isopen isopenbsd isoperator isoverlong ispath isperm ispos ispostfixoperator ispow2 isprimitivetype isprint ispty ispunct ispuretopfunction isqrt isquotedmacrocall isreadable isreadonly isready isreal issetequal issetgid issetuid isshredded issignleft issimple issimpleenoughtype issimplekw issingletontype isslotempty isslotfilled isslotmissing issocket issorted isspace issticky isstored isstructtype issubconditional issubnormal issubset issubstate issupbuild istaskdone istaskfailed istaskstarted isterminator istextmime istopfunction isunaryoperator isunix isunordered isuppercase isvalid isvarargtype isvatuple isvisible iswhitespace iswindows isword iswritable isxdigit iszero iterate ithchunk join joinpath keys keytype keyworddoc keywords kill kwerr kwftype kwfunc last lastindex lcm ldexp left length lengthforindex lerpi lessrational LinRange libc libm liftchunks liftfuncs limitrepr llvmtypes loadavg loaddocs lock lock log log10 log10pow2 log10pow5 log1p log2 logb logbL logbU longpath lookup lower lowerbound lowercase lowercasefirst lpad lreplace lstat lstrip ltoh macroexpand macroname makeproper malloc map mapany mapfilter mapfoldl mapfoldr mapreduce mapslices maptwice mark match materialize max maximum maxintfloat maxrss maybeview membershiptest memcpy memhash memmove merge mergewith meta metadata methods
syntax keyword juliaFunction midpoint mightalias min minimum minmax missing mkdir mkpath mktemp mktempdir mod mod1 mod2pi modestr modf modifyfield!_tfunc moduledoc moduleroot modules morespecific mtime mul12 muladd mulshift mulshiftinvsplit mulshiftmod1e9 mulshiftsplit multidoc multiplicativeinverse namemap nameof names namify nand narrow nbitslen ncodeunits ndigits ndigits0z ndigits0znb ndigits0zpb ndims neededdigits new newindex newindexer nextL nextfloat nextind nextmajor nextminor nextpatch nextpow nextprod nonmissingtype nonnothingtype nor normalize normpath notify notnothing nteltype nthreads ntoh ntuple ntupleany numerator objectdoc objectid occursin oct offsetin oftype one ones oneto oneunit only open operm opnames optimize ord ordtype oror pack8bools pad padding pairs parent parentindices parentmodule parse parseall parseatom parsedoc partialsort partialsortperm partition patches pathof pathsep pause paynehanek peek peekmeta peel permutedims pipeline pkgdir pkgorigins pointer popcount popdisplay poplinenum poptask poshighword position pow10bitsforindex pow2 pow5 pow5bits pow5invsplit pow5split powermod powm precision precompilableerror precompile preprocess prevfloat prevind prevpow print println printstyled prod product promote promoteK promoteV prompt propertynames pushdisplay pwd qbound qinvbound quot quoted rad2deg rand randn range rat rationalize rawhandle rdims read readavailable readchomp readdir readeach readline readlines readlink readuntil real realloc realloc2 realpath redisplay reduce reducedim1 reim reindex reinterpret release relockall relpath rem rem2pi rename repeat repeated replace replacefield!_tfunc repr require reset reseteof reshape resolve resolvebinding rest rethrow retry revargs reverse reverseind rewrap right roottask rot180 rotl90 rotr90 round rounding rpad rsplit rstrip rtoldefault run runtests safepoint samefile schanged schedule searchsorted searchsortedfirst searchsortedlast seek seekend seekstart selectdim sendfile setdiff setenv setfield!_tfunc setindex setprecision setrounding shapeindexer shouldlog show show show showable showarg showerror sign signature signbit signed signequal significand signless similar sin sinc sincos
syntax keyword juliaFunction sincosd sincospi sind sinh sinpi size sizeinbase sizeof skip skipchars skipmissing sleep slot2reg slug smerge something something sort sortperm sortslices splat split splitdir splitdrive splitexpr splitext splitpath splitprec sprint sqrt srand ssamap ssqs stacktrace startswith startup stat stderr stdout step strcat strerror strftime stride strides string strip striptype strptime structdiff struverror substrides success sum summary summarysize sumpair supertype swapfield!_tfunc switchtupleunion symdiff symlink systemerror systemsleep tags tail tailjoin tails take takewhile tan tand tanh tchanged tempdir tempname test1 test2 textwidth thisind thismajor thisminor thispa
syntax keyword juliaFunction tch threadid throw1 throw2 throwaxes1 throwbits throwbool throwdm throwintmult thrownonint throwsize0 throwsize1 throwstart throwstep throwto time timedwait timercb titlecase tmeet tmerge toInt128 toInt16 toInt32 toInt64 toInt8 toUInt128 toUInt16 toUInt32 toUInt64 toUInt8 touch trailingsize transcode transpose triplet trues trunc truncate truncbits truncmask tryf trylock tryparse trypoptask tstbit ttyhascolor tuplemerge tvar twiceprecision typeinf typeintersect typejoin typemax typemin typename types typesof typesplit typesubtract uabs uinttype umul256 unalias unaliascopy unblock uncolon uncurly undef undot unescape unindent union unioncomplexity unionlen unionsplitcost uniontypes unique unitrange unlink unlock unlockall unmark unquoted unsigned unswitchtupleunion unwrapcontext unwraptv unwrapva
syntax keyword juliaFunction uperm upperbound uppercase uppercasefirst uptime url userefs uuid5 uverrorname uvfinalize uvhandles validcall valtype values var vcat vec vect vectorfilter version view viewindexing visit wait walkdir which widemul widen widenconditional widenconst widenreturn widenwrappedconditional windowserror winprompt winuppercase withenv wordsize write writeexp writefixed writeshortest xdisplayable xor yield yieldto zero zeros zip

" LinearAlgebra
syntax keyword juliaFunction abs1 adjoint alpha asum axes beta bidiagcopy blasfunc broadcast broadcasted bunchkaufman check checknonsingular checkpositivedefinite checksquare chkargsok chkdiag chkfinite chkfullrank chklapackerror chknonsingular chkposdef chkside chkstride1 chktrans chkuplo chkuplofinite cholcopy cholesky choltype cis commutative cond condskeel conj convert copy cos cosh cross data dataids det diag diagind diagm diagzero dot dot1 dot2 dotc dotu du2 eigen eigmax eigmin eigsortby eigtype eigvals eigvecs elsize eltype errorbounds exactdiv exp f2c factorize factors floatmin2 fzero fzeropreserving gbmv gemm gemv getindex getproperty getqs givens givensAlgorithm handle hash hbmv hcat hemm hemv her2k herk hermitian hessenberg hilb hvcat iamax imag indmaxcolumn info inputeltypes inputmattypes integerpow interface inv invsquaring ipiv ipiv2perm isapprox isbanded isdiag isequal ishermitian isnanfillable isone isposdef isreal isstructurepreserving 
syntax keyword juliaFunction issuccess issymmetric istril istriu iszero iszerodefined iterate jpvt kron ldlt length libblas libblastrampoline liblapack libname log logabsdet logdet lowrankdowndate lowrankupdate lutype lyap map matmul2x2 matmul3x3 matprod muladd ndims needsquare norm norm1 norm2 normInf normMinusInf normalize normp nrm2 nullspace one onediag oneunit opnorm opnorm1 opnorm2 opnormInf ordschur parent peakflops permutedims pinv piv powm propertynames quasiparenta quasiparentt rank real rectangularQ rook rotations sample sbmv scal schur schurpow show showarg showerror similar sin sincos sinh size sqrt squareQ stride1 strides subsetrows suffix svd svdvals sylvester symm symmetric sympow symv syr2k syrk tan tanh test tilebufsize tol transpose transpose8x8 transposebaselength tridiag tril triu trmm trmv trsm trsv unaliascopy unw uplo values vec vectors vendor version versioninfo wrapperop zero

" PyPlot
syntax keyword juliaFunction acorr annotate arrow autoscale autumn axhline axhspan axis axline axvline axvspan bar barbs barh bone box boxplot broken_barh cla clabel clf clim cohere colorbar colors contour contourf cool copper csd delaxes disconnect draw errorbar eventplot figaspect figimage figlegend figtext figure fill_between fill_betweenx findobj flag gca gcf gci get_current_fig_manager get_figlabels get_fignums get_plot_commands ginput gray grid hexbin hist2D hlines hold hot hsv imread imsave imshow ioff ion ishold jet legend locator_params loglog margins matshow minorticks_off minorticks_on over pause pcolor pcolormesh pie pink plot plot_date plotfile polar prism psd quiver quiverkey rc rc_context rcdefaults rgrids savefig sca scatter sci semilogx semilogy set_cmap setp show specgram spectral spring spy stackplot stem step streamplot subplot subplot2grid subplot_tool subplots subplots_adjust summer suptitle table text thetagrids tick_params ticklabel_format tight_layout title tricontour tricontourf tripcolor triplot twinx twiny vlines waitforbuttonpress winter xkcd xlabel xlim xscale xticks ylabel ylim yscale yticks hist

syntax keyword juliaFunction add_subplot set_data set_3d_properties

" HDF5
syntax keyword juliaFunction h5open create_group create_dataset attributes delete_object delete_attribute

" DelimitedFiles
syntax keyword juliaFunction writedlm readdlm
