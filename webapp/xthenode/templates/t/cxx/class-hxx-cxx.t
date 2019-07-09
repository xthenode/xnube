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
%#   File: class-hxx-cxx.t
%#
%# Author: $author$
%#   Date: 5/2/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%Prefix,%(%else-then(%Prefix%,%(class)%)%)%,%
%PREFIX,%(%else-then(%PREFIX%,%(%toupper(%Prefix%)%)%)%)%,%
%prefix,%(%else-then(%_Prefix%,%(%tolower(%Prefix%)%)%)%)%,%
%Class,%(%else-then(%Class%,%(Class)%)%)%,%
%CLASS,%(%else-then(%CLASS%,%(%toupper(%Class%)%)%)%)%,%
%class,%(%else-then(%_Class%,%(%tolower(%Class%)%)%)%)%,%
%Implements,%(%else-then(%if-no(%is_Implements%,,%Implements%)%,%(%if-no(%is_Implements%,,Implement)%)%)%)%,%
%IMPLEMENTS,%(%else-then(%IMPLEMENTS%,%(%toupper(%Implements%)%)%)%)%,%
%implements,%(%else-then(%_Implements%,%(%tolower(%Implements%)%)%)%)%,%
%Extends,%(%else-then(%if-no(%is_Extends%,,%Extends%)%,%(%if-no(%is_Extends%,,Extend)%)%)%)%,%
%EXTENDS,%(%else-then(%EXTENDS%,%(%toupper(%Extends%)%)%)%)%,%
%extends,%(%else-then(%_Extends%,%(%tolower(%Extends%)%)%)%)%,%
%ClassT,%(%else-then(%ClassT%,%(%Class%%if-no(%is_Template%,,T)%)%)%)%,%
%CLASST,%(%else-then(%CLASST%,%(%toupper(%ClassT%)%)%)%)%,%
%classt,%(%else-then(%_ClassT%,%(%tolower(%ClassT%)%)%)%)%,%
%ClassTImplements,%(%else-then(%ClassTImplements%,%(%if-no(%is_Implements%,,%if-no(%is_Template%,%ClassT%,T)%Implements)%)%)%)%,%
%CLASSTIMPLEMENTS,%(%else-then(%CLASSTIMPLEMENTS%,%(%toupper(%ClassTImplements%)%)%)%)%,%
%classtimplements,%(%else-then(%_ClassTImplements%,%(%tolower(%ClassTImplements%)%)%)%)%,%
%ClassTExtends,%(%else-then(%ClassTExtends%,%(%if-no(%is_Extends%,,%if-no(%is_Template%,%ClassT%,T)%Extends)%)%)%)%,%
%CLASSTEXTENDS,%(%else-then(%CLASSTEXTENDS%,%(%toupper(%ClassTExtends%)%)%)%)%,%
%classtextends,%(%else-then(%_ClassTExtends%,%(%tolower(%ClassTExtends%)%)%)%)%,%
%TImplements,%(%else-then(%TImplements%,%(%if-no(%is_Template%,%Class%TImplements,%Implements%)%)%)%)%,%
%TIMPLEMENTS,%(%else-then(%TIMPLEMENTS%,%(%toupper(%TImplements%)%)%)%)%,%
%timplements,%(%else-then(%_TImplements%,%(%tolower(%TImplements%)%)%)%)%,%
%TExtends,%(%else-then(%TExtends%,%(%if-no(%is_Template%,%Class%TExtends,%Extends%)%)%)%)%,%
%TEXTENDS,%(%else-then(%TEXTENDS%,%(%toupper(%TExtends%)%)%)%)%,%
%textends,%(%else-then(%_TExtends%,%(%tolower(%TExtends%)%)%)%)%,%
%Template,%(%else-then(%Template%,%(%if-no(%is_Implements%,,class TImplements = %TImplements%)%%if-no(%is_Implements%,,%if-no(%is_Extends%,,%(, )%)%)%%if-no(%is_Extends%,,class TExtends = %TExtends%)%)%)%)%,%
%TEMPLATE,%(%else-then(%TEMPLATE%,%(%toupper(%Template%)%)%)%)%,%
%template,%(%else-then(%_Template%,%(%tolower(%Template%)%)%)%)%,%
%File,%(%else-then(%File%,%(%Class%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%%(%
%%include(%include_path%/hxx-cxx.t)%%
%)%)%