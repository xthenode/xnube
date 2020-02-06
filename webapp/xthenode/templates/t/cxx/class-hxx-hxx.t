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
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%if-no(%is_Template%,%(%then-if(%if-then(%Implements%, %ClassT%Implements;)%,
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
%%if-then(%then-if(%if-then(%ClassTImplements%, Implements;)%,
    typedef )%%
%%then-if(%if-then(%ClassTExtends%, Extends;)%,
    typedef )%%
%,
)%%
%    typedef %ClassT% Derives; 

    ///////////////////////////////////////////////////////////////////////
    /// constructors / destructor
    ///////////////////////////////////////////////////////////////////////
    %ClassT%%(()%const %ClassT%& copy%())% {
    }
    %ClassT%%(()%%())% {
    }
    virtual ~%ClassT%%(()%%())% {
    }
}; /// class %if-then(%Exported%, )%%ClassT%
%if-no(%is_Template%,,%(typedef %ClassT%<> %Class%;
)%)%)%)%