%########################################################################
%# Copyright (c) 1988-2020 $organization$
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
%#   File: Xthenode-form-fields-html.t
%#
%# Author: $author$
%#   Date: 2/16/2020
%########################################################################
%with(%
%is_inputs,%(%else-then(%is_inputs%,%(%is_Inputs%)%)%)%,%
%inputs,%(%else-then(%if-no(%is_inputs%,,%(%inputs%)%)%,%(%if-no(%is_inputs%,,%(%InputName%)%)%)%)%)%,%
%Inputs,%(%else-then(%if-no(%is_inputs%,,%(%Inputs%)%)%,%(%if-no(%is_inputs%,,%(%inputs%)%)%)%)%)%,%
%INPUTS,%(%else-then(%INPUTS%,%(%toupper(%Inputs%)%)%)%)%,%
%inputs,%(%else-then(%_inputs%,%(%tolower(%Inputs%)%)%)%)%,%
%is_selects,%(%else-then(%is_selects%,%(%is_Selects%)%)%)%,%
%selects,%(%else-then(%if-no(%is_selects%,,%(%selects%)%)%,%(%if-no(%is_selects%,,%(%SelectName%)%)%)%)%)%,%
%Selects,%(%else-then(%if-no(%is_selects%,,%(%Selects%)%)%,%(%if-no(%is_selects%,,%(%selects%)%)%)%)%)%,%
%SELECTS,%(%else-then(%SELECTS%,%(%toupper(%Selects%)%)%)%)%,%
%selects,%(%else-then(%_selects%,%(%tolower(%Selects%)%)%)%)%,%
%%(%
%%parse(%Inputs%,;,,,,%(%with(%
%Name,%(%else-then(%left(%Input%,:)%,%(%Input%)%)%)%,%
%Value,%(%else-then(%left(%right-of-left(%Input%,:)%,:)%,%(%Name%)%)%)%,%
%Text,%(%else-then(%right(%Input%,:)%,%(%Name%)%)%)%,%
%%(%
%
            <b></b>%Text%:<input name="%Name%" value="%Value%"/><b></b>
            <input type="checkbox" name="is_%Name%" value="no" unchecked="checked">no</input><br/>%
%)%)%)%,Input)%%
%%parse(%Selects%,;,,,,%(%with(%
%Name,%(%else-then(%left(%Input%,:)%,%(%Input%)%)%)%,%
%Value,%(%else-then(%left(%right-of-left(%Input%,:)%,:)%,%(%Name%)%)%)%,%
%Text,%(%else-then(%right(%Input%,:)%,%(%Name%)%)%)%,%
%%(%
%
            <b></b>%Text%:<select name="%Name%">
            <option value="%Value%">%Value%</option>
            </select><b></b>
            <input type="checkbox" name="is_%Name%" value="no" unchecked="checked">no</input><br/>%
%)%)%)%,Input)%%
%)%)%