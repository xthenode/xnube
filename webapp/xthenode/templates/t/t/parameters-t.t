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
%#   File: parameters-t.t
%#
%# Author: $author$
%#   Date: 7/7/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%parameters,%(%else-then(%parameters%,%()%)%)%,%
%Parameters,%(%else-then(%Parameters%,%(%parameters%)%)%)%,%
%%(%
%%if-no(%is_Parameters%,,%(%
%%parse(%Parameters%,;,,,,%(%
%%with(%
%Value,%(%else-then(%right-of-left(%Parameter%,=)%,%(%Parameter%)%)%)%,%
%Name,%(%else-then(%left(%Parameter%,=)%,%(%Parameter%)%)%)%,%
%Parameter,%(%Name%)%,%
%PARAMETER,%(%else-then(%PARAMETER%,%(%toupper(%Parameter%)%)%)%)%,%
%parameter,%(%else-then(%parameter%,%(%tolower(%Parameter%)%)%)%)%,%
%%(%
%%if-no(%is_Lower%,%(%
%%%is_%Parameter%%(,)%%%%(()%%%else-then%(()%%%is_%Parameter%%%%(,)%%%%(()%%is_Parameter%%())%%%%())%%%%())%%%%(,)%%%
%
%%%%Parameter%%(,)%%%%(()%%%else-then%(()%%%%Parameter%%%%(,)%%%%(()%%Value%%())%%%%())%%%%())%%%%(,)%%%
%
%)%,%(%
%%%is_%parameter%%(,)%%%%(()%%%else-then%(()%%%is_%parameter%%%%(,)%%%%(()%%is_Parameter%%())%%%%())%%%%())%%%%(,)%%%
%
%%%%parameter%%(,)%%%%(()%%%else-then%(()%%%%parameter%%%%(,)%%%%(()%%Value%%())%%%%())%%%%())%%%%(,)%%%
%
%%if-no(%is_UpperLower%,,%(%
%%%%Parameter%%(,)%%%%(()%%%else-then%(()%%%%Parameter%%%%(,)%%%%(()%%%%parameter%%%%())%%%%())%%%%())%%%%(,)%%%
%
%)%)%%
%)%)%%
%%if-no(%is_UpperLower%,,%(%
%%%%PARAMETER%%(,)%%%%(()%%%else-then%(()%%%%PARAMETER%%%%(,)%%%%(()%%%toupper%(()%%%%Parameter%%%%())%%%%())%%%%())%%%%())%%%%(,)%%%
%
%%%%parameter%%(,)%%%%(()%%%else-then%(()%%%_%Parameter%%%%(,)%%%%(()%%%tolower%(()%%%%Parameter%%%%())%%%%())%%%%())%%%%())%%%%(,)%%%
%
%)%)%%
%)%)%%
%)%,Parameter)%%
%)%)%%
%)%)%