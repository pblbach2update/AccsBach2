<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DashBoardControl.ascx.cs"
    Inherits="Accs.Web.usercontrol.DashBoardControl" EnableViewState="False" %>
<div class="ListViewContainer">
    <div class="userBox" style="clear: both">
        <asp:Label ID="lbSessionInfo" runat="server" Text=""></asp:Label>
        
    </div>
    <asp:ListView ID="lvBranchBankWise" ItemPlaceholderID="binfo" runat="server" OnLayoutCreated="lvBranchBankWise_LayoutCreated">
        <LayoutTemplate>
            <table class="ctable" id="test">
                <thead>
                    <tr class="">
                        <th class="brCellWidth">
                            <span class="brCellMaxWidth">Branch</span>
                        </th>
                        <th scope="col" abbr="Home" colspan="18 " style="border: solid 2px #443376">
                            Outward
                        </th>
                        <th scope="col" abbr="Home" colspan="6" style="border: solid 2px #22639C">
                            Inward
                        </th>
                        <th scope="col" abbr="Home" colspan="10" style="border: solid 2px #89DA67">
                            Outward Return
                        </th>
                        <th scope="col" abbr="Home" colspan="6" style="border: solid 2px #524322">
                            Inward Return
                        </th>
                    </tr>
                    <tr>
                        <th scope="col" abbr="Home">
                            <span></span>
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Scan
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Make
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Check
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            RTS
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Sent
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            PBM
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Mismatch
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Ex to CH
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Rejected
                        </th>
                        <th colspan="2">
                            PBM
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Rcv
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Mismatch
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            RTS
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Sent
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            PBM
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Mismatch
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Return Final
                        </th>
                        <th colspan="2">
                            PBM
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Received
                        </th>
                        <th scope="col" abbr="Home" colspan="2">
                            Mismatch
                        </th>
                    </tr>
                    <tr>
                        <th scope="col" abbr="Home">
                            <span></span>
                        </th>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">C</span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">Am</span>
                        </td>
                    </tr>
                </thead>
            </table>
            <div style="max-height: 120px; overflow: auto;">
                <table class="ctable">
                    <asp:PlaceHolder runat="server" ID="binfo"></asp:PlaceHolder>
                </table>
            </div>
            <table class="ctable">
                <tbody>
                    <tr>
                        <td class="brCellWidth">
                            <span class="brCellMaxWidth">Total</span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phScanCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phscanAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phMakeCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phMakeAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phCheckCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phCheckAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phRTSCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phRTSAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phPBMSentCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phPBMSentAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phPBMReceivedCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phPBMReceivedAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phMismatchCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phMismatchAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phExportToCHCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phExportToCHAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phRejectCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phRejectAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phPBMInwardCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phPBMInwardAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phInwardRcvCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phInwardRcvAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="PhInwardMismatchCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td>
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phInwardMismatchAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phOutRetRTSCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phOutRetRTSAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phOutRetSentCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phOutRetSentAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phPBMOutRetRcvCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phPBMOutRetRcvAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phOutRetMismatchCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phOutRetMismatchAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phReturnFinalCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phReturnFinalAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phPBMInwardRetCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phPBMInwardRetAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phPBMInwardRetRcvCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phPBMInwardRetRcvAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellCWidth">
                            <span class="brDataCellCMaxWidth">
                                <asp:PlaceHolder ID="phInwardRetMismatchCount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                        <td class="brDataCellAWidth">
                            <span class="brDataCellAMaxWidth">
                                <asp:PlaceHolder ID="phInwardRetMismatchAmount" runat="server"></asp:PlaceHolder>
                            </span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td class="brCellWidth">
                    <span class="brCellMaxWidth">
                        <%#ShowGroupName()%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("ScanCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("ScanAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("MakeCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("MakeAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("CheckCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("CheckAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("RTSCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("RTSAmount")%>
                    </span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("PbmSentCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("PbmSentAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("PbmReceivedCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("PbmReceivedAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("MismatchCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("MismatchAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("EXportToCHCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("EXportToCHAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("RejectedCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("RejectedAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("InPBMRcvCount")%></span>
                </td>
                <td>
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("InPBMRcvAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("InwardRcvCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("InwardRcvAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("InMismatchCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("InMismatchAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth"><a href='ViewGroupItemBranch.aspx?ctype=<%=(ClearingType+10)%>&bid=<%#Eval("BranchId")%>'>
                    </a>
                        <%#Eval("InRTSCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("InRTSAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("OutRetPBMSentCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("OutRetPBMSentAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("OutRetPBMRcvCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("OutRetPBMRcvAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("OutRetMismatchCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("OutRetMismatchAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("ReturnFinalCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("ReturnFinalAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("InwardRetPBMCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("InwardRetPBMAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("InwardRetRcvCount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("InwardRetRcvAmount")%></span>
                </td>
                <td class="brDataCellCWidth">
                    <span class="brDataCellCMaxWidth">
                        <%#Eval("InRetMismatchCount")%></span>
                </td>
                <td class="brDataCellAWidth">
                    <span class="brDataCellAMaxWidth">
                        <%#Eval("InRetMismatchAmount")%></span>
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    <div style="margin: 0 auto; width: 800px; padding: 10px">
        <asp:HyperLink ID="hpOutRTS" runat="server" Target="_blank" CssClass="linkClass">
            OutRTS(<asp:Label ID="lbOutRTS" runat="server" Text="Label"></asp:Label>)</asp:HyperLink>
        <asp:HyperLink ID="hpOutMismatch" runat="server" Target="_blank" CssClass="linkClass">
            OutMismatch(<asp:Label ID="lbOutMismatch" runat="server" Text=""></asp:Label>)</asp:HyperLink>
        <asp:HyperLink ID="hpOutRej" runat="server" Target="_blank" CssClass="linkClass">
            OutRej(<asp:Label ID="lbOutRej" runat="server" Text=""></asp:Label>)</asp:HyperLink>
        <asp:HyperLink ID="hpInwardDuplicate" NavigateUrl="" runat="server" Target="_blank" CssClass="linkClass">
            InwardDuplicate(<asp:Label ID="lbInwardDuplicate" runat="server" Text=""></asp:Label>)</asp:HyperLink>
        <asp:HyperLink ID="hpInwardMismatch" runat="server" Target="_blank" CssClass="linkClass">
            InwarMismatch(<asp:Label ID="lbInwardMismatch" runat="server" Text=""></asp:Label>)</asp:HyperLink>
        <asp:HyperLink ID="hpOutRetRTS" runat="server" Target="_blank" CssClass="linkClass">
            OutRetRTS(<asp:Label ID="lbOutRetRTS" runat="server" Text=""></asp:Label>)</asp:HyperLink>
        <asp:HyperLink ID="hpOutRetMismatch" runat="server" Target="_blank" CssClass="linkClass">
            OutRetMismatch(<asp:Label ID="lbOutRetMismatch" runat="server" Text=""></asp:Label>)</asp:HyperLink>
        <asp:HyperLink ID="hpInwardRetMismatch" runat="server" Target="_blank" CssClass="linkClass">
            InwardRetMismatch(<asp:Label ID="lbInwardRetMismatch" runat="server" Text=""></asp:Label>)</asp:HyperLink>
    </div>
    <div style="margin:0 auto; width: 800px; padding: 10px">
        <asp:PlaceHolder runat="server" ID="phCurrencyWiseList" EnableViewState="False"></asp:PlaceHolder>
    </div>
</div>
