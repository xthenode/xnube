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
%#   File: hxx-cxx.t
%#
%# Author: $author$
%#   Date: 5/2/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%Header,%(%else-then(%Header%,%(%if(%equal(c,%Extension%)%,h,%if(%equal(cpp,%Extension%)%,hpp,%if(%equal(cxx,%Extension%)%,hxx,%else-then(%Extension%,hxx)%)%)%)%)%)%)%,%
%HEADER,%(%else-then(%HEADER%,%(%toupper(%Header%)%)%)%)%,%
%header,%(%else-then(%_Header%,%(%tolower(%Header%)%)%)%)%,%
%Body,%(%else-then(%Body%,%(%if(%equal(h,%Header%)%,c,%(%if(%equal(hpp,%Header%)%,cpp,cxx)%)%)%)%)%)%,%
%BODY,%(%else-then(%BODY%,%(%toupper(%Body%)%)%)%)%,%
%body,%(%else-then(%_Body%,%(%tolower(%Body%)%)%)%)%,%
%File,%(%else-then(%File%,%(%else-then(%Class%,%(file)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%Name,%(%else-then(%Name%,%(%else-then(%filebase(%File%)%,%File%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%Extension,%(%else-then(%if-no(%is_Extension%,,%Extension%)%,%(%else-then(%fileextension(%File%)%,%Header%)%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%Headers,%(%else-then(%Headers%,%(hpp;hxx;h)%)%)%,%
%HEADERS,%(%else-then(%HEADERS%,%(%toupper(%Headers%)%)%)%)%,%
%headers,%(%else-then(%_Headers%,%(%tolower(%Headers%)%)%)%)%,%
%Header_or_Body,%(%else-then(%Header_or_Body%,%(%if(%parse(%Headers%,;,,,,%(%equal(%Header%,%Extension%)%)%,Header)%,%Header%,%Body%)%)%)%)%,%
%HEADER_OR_BODY,%(%else-then(%HEADER_OR_BODY%,%(%toupper(%Header_or_Body%)%)%)%)%,%
%header_or_body,%(%else-then(%_Header_or_Body%,%(%tolower(%Header_or_Body%)%)%)%)%,%
%File_ifndef,%(%else-then(%if-no(%is_File_ifndef%,,%File_ifndef%)%,%(%if-no(%is_File_ifndef%,,xos/base)%)%)%)%,%
%FILE_IFNDEF,%(%else-then(%FILE_IFNDEF%,%(%toupper(%File_ifndef%)%)%)%)%,%
%file_ifndef,%(%else-then(%_File_ifndef%,%(%tolower(%File_ifndef%)%)%)%)%,%
%File_ifndef_define,%(%else-then(%File_ifndef_define%,%(_%parse(%FILE_IFNDEF%,/,,_,,%(%IFNDEF%)%,IFNDEF)%_%NAME%_%EXTENSION%_)%)%)%,%
%FILE_IFNDEF_DEFINE,%(%else-then(%FILE_IFNDEF_DEFINE%,%(%toupper(%File_ifndef_define%)%)%)%)%,%
%file_ifndef_define,%(%else-then(%_File_ifndef_define%,%(%tolower(%File_ifndef_define%)%)%)%)%,%
%File_directory,%(%else-then(%if-no(%is_File_directory%,,%File_directory%)%,%(%if-no(%is_File_directory%,,%parse(%File_ifndef%,_,,/)%)%)%)%)%,%
%FILE_DIRECTORY,%(%else-then(%FILE_DIRECTORY%,%(%toupper(%File_directory%)%)%)%)%,%
%file_directory,%(%else-then(%_File_directory%,%(%tolower(%File_directory%)%)%)%)%,%
%Include,%(%else-then(%if-no(%is_Include%,,%Include%)%,%(%if-no(%is_Include%,,xos/base/Base.%Header%)%)%)%)%,%
%INCLUDE,%(%else-then(%INCLUDE%,%(%toupper(%Include%)%)%)%)%,%
%include,%(%else-then(%_Include%,%(%tolower(%Include%)%)%)%)%,%
%Sys_header,%(%else-then(%Sys_header%,%(%if(%equal(%Header%,h)%,.h)%)%)%)%,%
%SYS_HEADER,%(%else-then(%SYS_HEADER%,%(%toupper(%Sys_header%)%)%)%)%,%
%sys_header,%(%else-then(%_Sys_header%,%(%tolower(%Sys_header%)%)%)%)%,%
%Sys_include,%(%else-then(%if-no(%is_Sys_include%,,%Sys_include%)%,%(%if-no(%is_Sys_include%,,string%Sys_header%)%)%)%)%,%
%SYS_INCLUDE,%(%else-then(%SYS_INCLUDE%,%(%toupper(%Sys_include%)%)%)%)%,%
%sys_include,%(%else-then(%_Sys_include%,%(%tolower(%Sys_include%)%)%)%)%,%
%Includes,%(%else-then(%Includes%,%(%parse(%Include%,;,,,%(#include "%Include%"
)%,Include)%)%)%)%,%
%INCLUDES,%(%else-then(%INCLUDES%,%(%toupper(%Includes%)%)%)%)%,%
%includes,%(%else-then(%_Includes%,%(%tolower(%Includes%)%)%)%)%,%
%Sys_includes,%(%else-then(%Sys_includes%,%(%parse(%Sys_include%,;,,,%(#include <%Include%>
)%,Include)%)%)%)%,%
%SYS_INCLUDES,%(%else-then(%SYS_INCLUDES%,%(%toupper(%Sys_includes%)%)%)%)%,%
%sys_includes,%(%else-then(%_Sys_includes%,%(%tolower(%Sys_includes%)%)%)%)%,%
%Namespace,%(%else-then(%if-no(%is_Namespace%,,%Namespace%)%,%(%if-no(%is_Namespace%,,%File_directory%)%)%)%)%,%
%NAMESPACE,%(%else-then(%NAMESPACE%,%(%toupper(%Namespace%)%)%)%)%,%
%namespace,%(%else-then(%_Namespace%,%(%tolower(%Namespace%)%)%)%)%,%
%Namespace_begin,%(%
%%then-if(%parse(%Namespace%,/,,,,%(namespace %ns% {
)%,ns)%,%(
)%)%%
%)%,%
%NAMESPACE_BEGIN,%(%else-then(%NAMESPACE_BEGIN%,%(%toupper(%Namespace_begin%)%)%)%)%,%
%namespace_begin,%(%else-then(%_Namespace_begin%,%(%tolower(%Namespace_begin%)%)%)%)%,%
%Namespace_end,%(%
%%then-if(%reverse-parse(%Namespace%,/,,,,%(} /// namespace %ns%
)%,ns)%,%(
)%)%%
%)%,%
%NAMESPACE_END,%(%else-then(%NAMESPACE_END%,%(%toupper(%Namespace_end%)%)%)%)%,%
%namespace_end,%(%else-then(%_Namespace_end%,%(%tolower(%Namespace_end%)%)%)%)%,%
%%(%
%%include(%include_path%/file-%Header%-%Body%.t)%%
%%include(%include_path%/%Header_or_Body%-%Header_or_Body%.t)%%
%)%)%