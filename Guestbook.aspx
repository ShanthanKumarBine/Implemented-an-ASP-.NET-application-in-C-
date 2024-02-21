<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Guestbook.aspx.cs" Inherits="Guestbook" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Guestbook</title>
    <style type="text/css">
        .style1
       {
          width: 100%;
            margin-top: 60px;
        }
       .singleLineTextBox
       {
          width: 300px;
       }
       .multilineTextBox
       {
        }
        .auto-style1 {
            height: 92px;
        }
        .auto-style2 {
            height: 49px;
        }
        .auto-style3 {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <h3>
           Enter Student Details:</h3>
       <table class="style1">

           <tr>
               <td valign="top" class="auto-style3">
                   Student Type:
               </td>
               <td valign="top">
                    <asp:RadioButton id="Radio3" Text="Masters" Checked="True" GroupName="RadioGroup1" runat="server" /><br />
               <br />
                    <asp:RadioButton id="Radio4" Text="Bachelors" Checked="True" GroupName="RadioGroup1" runat="server" /><br />
               </td>
           </tr>

          <tr>
             <td valign="top" class="auto-style3">
                 First Name:</td>
             <td valign="top" class="auto-style3">
                <asp:TextBox ID="FirstNameTextBox" runat="server" CssClass="singleLineTextBox"></asp:TextBox>
             </td>
          </tr>
          <tr>
             <td valign="top">
                 Last Name:</td>
             <td valign="top">
                <asp:TextBox ID="LastNameTextBox" runat="server" CssClass="singleLineTextBox"></asp:TextBox>
             </td>
          </tr>
          <tr>
             <td valign="top" class="auto-style2">
                 Credits Taking:</td>
             <td valign="top" >
                <asp:TextBox ID="CreditsTextBox" runat="server" CssClass="singleLineTextBox"> </asp:TextBox>
             </td>
          </tr>
           <tr>
               <td valign="top" class="auto-style3">
                   Residency:
               </td>
               <td valign="top">
                    <asp:RadioButton id="Radio1" Text="In-State" Checked="True" GroupName="RadioGroup2" runat="server" /><br />
               <br />
                    <asp:RadioButton id="Radio2" Text="Out-State" Checked="True" GroupName="RadioGroup2" runat="server" /><br />
               </td>
           </tr>
          <tr>
             <td valign="top" class="auto-style1">
                 </td>
             <td valign="top" class="auto-style1">
                <asp:Button ID="submitButton" runat="server" Text="Submit" 
                   onclick="submitButton_Click" />
                &nbsp;<asp:Button ID="clearButton" runat="server" Text="Clear" 
                   onclick="clearButton_Click" />
             </td>
          </tr>
       </table>
        <asp:GridView ID="messagesGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="GuestbookAccessDataSource" ForeColor="#333333" GridLines="None" style="z-index: 1; left: 356px; top: 539px; position: absolute; height: 150px; width: 589px; margin-top: 0px;" DataKeyNames="ID">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="StudentType" HeaderText="StudentType" SortExpression="StudentType" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Credits" HeaderText="Credits" SortExpression="Credits" />
                <asp:BoundField DataField="residency" HeaderText="residency" SortExpression="residency" />
            </Columns>
            <EditRowStyle BackColor="#999999" Wrap="False" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Wrap="False" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
        <br />
       
           <asp:AccessDataSource ID="GuestbookAccessDataSource" runat="server" DataFile="~/App_Data/Guestbook.mdb" OnSelecting="AccessDataSource1_Selecting" SelectCommand="SELECT StudentDetails.* FROM StudentDetails" DeleteCommand="DELETE FROM StudentDetails" InsertCommand="INSERT INTO StudentDetails(ID, StudentType, FirstName, LastName, residency, Credits) VALUES (,,,,,)" UpdateCommand="UPDATE StudentDetails SET StudentType =, FirstName =, ID =, LastName =, Credits =, residency =">
           </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
