%########################################################################
%# Copyright (c) 1988-2019 $organization$
%#
%# This software is provided by the author and contributors ``as is'' 
%# and any express or implied warranties, including, but not limited to, 
%# the implied warranties of merchantability and fitness for a particular 
%# purpose are disclaimed. In no event shall the author or contributors 
%# be liable for any direct, indirect, incidental, special, exemplary, 
%# or consequential damages (including, but not limited to, procurement 
%# of substitute goods or services; loss of use, data, or profits; or 
%# business interruption) however caused and on any theory of liability, 
%# whether in contract, strict liability, or tort (including negligence 
%# or otherwise) arising in any way out of the use of this software, 
%# even if advised of the possibility of such damage.
%#
%#   File: class-hxx-hxx.t
%#
%# Author: $author$
%#   Date: 5/2/2019
%########################################################################
%with(%
%is_typedef_implements,%(%else-then(%is_typedef_implements%,%(%is_Typedef_implements%)%)%)%,%
%typedef_implements,%(%else-then(%if-no(%is_typedef_implements%,,%(%typedef_implements%)%)%,%(%if-no(%is_typedef_implements%,,%(Implements)%)%)%)%)%,%
%Typedef_implements,%(%else-then(%if-no(%is_typedef_implements%,,%(%Typedef_implements%)%)%,%(%if-no(%is_typedef_implements%,,%(%typedef_implements%)%)%)%)%)%,%
%TYPEDEF_IMPLEMENTS,%(%else-then(%TYPEDEF_IMPLEMENTS%,%(%toupper(%Typedef_implements%)%)%)%)%,%
%typedef_implements,%(%else-then(%_typedef_implements%,%(%tolower(%Typedef_implements%)%)%)%)%,%
%is_typedef_extends,%(%else-then(%is_typedef_extends%,%(%is_Typedef_extends%)%)%)%,%
%typedef_extends,%(%else-then(%if-no(%is_typedef_extends%,,%(%typedef_extends%)%)%,%(%if-no(%is_typedef_extends%,,%(Extends)%)%)%)%)%,%
%Typedef_extends,%(%else-then(%if-no(%is_typedef_extends%,,%(%Typedef_extends%)%)%,%(%if-no(%is_typedef_extends%,,%(%typedef_extends%)%)%)%)%)%,%
%TYPEDEF_EXTENDS,%(%else-then(%TYPEDEF_EXTENDS%,%(%toupper(%Typedef_extends%)%)%)%)%,%
%typedef_extends,%(%else-then(%_typedef_extends%,%(%tolower(%Typedef_extends%)%)%)%)%,%
%is_typedef_derives,%(%else-then(%is_typedef_derives%,%(%is_Typedef_derives%)%)%)%,%
%typedef_derives,%(%else-then(%if-no(%is_typedef_derives%,,%(%typedef_derives%)%)%,%(%if-no(%is_typedef_derives%,,%(Derives)%)%)%)%)%,%
%Typedef_derives,%(%else-then(%if-no(%is_typedef_derives%,,%(%Typedef_derives%)%)%,%(%if-no(%is_typedef_derives%,,%(%typedef_derives%)%)%)%)%)%,%
%TYPEDEF_DERIVES,%(%else-then(%TYPEDEF_DERIVES%,%(%toupper(%Typedef_derives%)%)%)%)%,%
%typedef_derives,%(%else-then(%_typedef_derives%,%(%tolower(%Typedef_derives%)%)%)%)%,%
%is_copy_constructor,%(%else-then(%is_copy_constructor%,%(%is_Copy_constructor%)%)%)%,%
%copy_constructor,%(%else-then(%if-no(%is_copy_constructor%,,%(%copy_constructor%)%)%,%(%if-no(%is_copy_constructor%,,%()%)%)%)%)%,%
%Copy_constructor,%(%else-then(%if-no(%is_copy_constructor%,,%(%Copy_constructor%)%)%,%(%if-no(%is_copy_constructor%,,%(%copy_constructor%)%)%)%)%)%,%
%COPY_CONSTRUCTOR,%(%else-then(%COPY_CONSTRUCTOR%,%(%toupper(%Copy_constructor%)%)%)%)%,%
%copy_constructor,%(%else-then(%_copy_constructor%,%(%tolower(%Copy_constructor%)%)%)%)%,%
%is_constructor,%(%else-then(%is_constructor%,%(%is_Constructor%)%)%)%,%
%constructor,%(%else-then(%if-no(%is_constructor%,,%(%constructor%)%)%,%(%if-no(%is_constructor%,,%()%)%)%)%)%,%
%Constructor,%(%else-then(%if-no(%is_constructor%,,%(%Constructor%)%)%,%(%if-no(%is_constructor%,,%(%constructor%)%)%)%)%)%,%
%CONSTRUCTOR,%(%else-then(%CONSTRUCTOR%,%(%toupper(%Constructor%)%)%)%)%,%
%constructor,%(%else-then(%_constructor%,%(%tolower(%Constructor%)%)%)%)%,%
%is_destructor,%(%else-then(%is_destructor%,%(%is_Destructor%)%)%)%,%
%is_is_destructor,%(%else-then(%is_is_destructor%,%(%is_is_Destructor%)%)%)%,%
%destructor,%(%else-then(%if-no(%is_destructor%,,%(%destructor%)%)%,%(%if-no(%is_destructor%,,%(%if-no(%is_is_destructor%,,%(virtual)%)%)%)%)%)%)%,%
%Destructor,%(%else-then(%if-no(%is_destructor%,,%(%Destructor%)%)%,%(%if-no(%is_destructor%,,%(%destructor%)%)%)%)%)%,%
%DESTRUCTOR,%(%else-then(%DESTRUCTOR%,%(%toupper(%Destructor%)%)%)%)%,%
%destructor,%(%else-then(%_destructor%,%(%tolower(%Destructor%)%)%)%)%,%
%%(%
%%if-no(%is_Class%,,%(%
%%if-no(%is_Template%,%(%then-if(%if-then(%Implements%, %ClassT%Implements;)%,
typedef )%%
%%then-if(%if-then(%Extends%, %ClassT%Extends;)%,
typedef )%)%)%
///////////////////////////////////////////////////////////////////////
///  Class: %ClassT%
///////////////////////////////////////////////////////////////////////
%if-no(%is_Template%,,%(template <%Template%>
)%)%class %if-then(%Exported%, )%%ClassT%%
%%then-if(%then-if(%if-then(%ClassTImplements%,%if(%ClassTExtends%,%(,)%)%)%, virtual public )%%
%%then-if(%ClassTExtends%, public )%,:)% {
public:%
%%if-then(%then-if(%if-then(%ClassTImplements%, %Typedef_implements%;)%,
    typedef )%%
%%then-if(%if-then(%ClassTExtends%, %Typedef_extends%;)%,
    typedef )%%
%,
)%%
%    typedef %ClassT% %Typedef_derives%; 
%if(%if-no(%is_copy_constructor%,,yes)%%if-no(%is_constructor%,,yes)%%if-no(%is_destructor%,,yes)%,%(
    ///////////////////////////////////////////////////////////////////////
    /// constructors / destructor
    ///////////////////////////////////////////////////////////////////////
%if-no(%is_copy_constructor%,,%(    %if-then(%Copy_constructor%,%( )%)%%ClassT%%(()%const %ClassT%& copy%())% {
    }
)%)%%if-no(%is_constructor%,,%(    %if-then(%Constructor%,%( )%)%%ClassT%%(()%%())% {
    }
)%)%%if-no(%is_destructor%,,%(    %if-then(%Destructor%,%( )%)%~%ClassT%%(()%%())% {
    }
)%)%)%)%}; /// class %if-then(%Exported%, )%%ClassT%
%if-no(%is_Template%,,%(typedef %ClassT%<> %Class%;
)%)%%
%)%)%%
%)%)%