<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestAjaxControlToolKitModel.aspx.cs" Inherits="Accs.Web.TestAjaxControlToolKitModel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .modalBackground {
            background-color: #336699;
            filter: alpha(opacity=80);
            opacity: 0.8;
        }

            .modalBackground:hover {
                background-color: #CC3300;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:LinkButton ID="lbSowPopup" runat="server" Text="Button" />
                
                <asp:Panel ID="Panel1" runat="server">
                    <div class="HellowWorldPopup">
                        <div class="PopupHeader" id="PopupHeader">Header</div>
                        <div class="PopupBody">
                            <p>This is a simple modal dialog</p>
                        </div>
                        <div class="Controls">
                            <input id="btnOkay" type="button" value="Done" />
                            <input id="btnCancel" type="button" value="Cancel" />
                        </div>
                    </div>
                </asp:Panel>

                <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                    TargetControlID="lbSowPopup" PopupControlID="Panel1"
                    BackgroundCssClass="ModalPopupBG">
                </asp:ModalPopupExtender>

                
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
