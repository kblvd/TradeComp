<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowInfo.aspx.cs" Inherits="TradeComp.ShowInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="157px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="517px">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Имя" SortExpression="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Фамилия" SortExpression="Surname" />
                    <asp:BoundField DataField="YeafOfBirth" HeaderText="Год рождения" SortExpression="YeafOfBirth" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompDBConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Названия товара" SortExpression="Title" />
                    <asp:BoundField DataField="idCustomer" HeaderText="Номер заказчика" ReadOnly="True" SortExpression="idCustomer" />
                    <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
                    <asp:BoundField DataField="Quant" HeaderText="Количество" SortExpression="Quant" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompDBConnectionString %>" DeleteCommand="Delete from Orders where Id=@Id" InsertCommand="Insert into Orders (Title, IdCustomer, Price, Quant) values (@Title, @IdCustomer, @Price, @Quant) " SelectCommand="SELECT * FROM [Orders] WHERE ([idCustomer] = @idCustomer)" UpdateCommand="Update Orders set Title = @Title, IdCustomer = @IdCustomer, Price = @Price, Quant = @Quant where Id = @Id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="Id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="GridView1" Name="IdCustomer" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Price" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox3" Name="Quant" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="idCustomer" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="Title" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="IdCustomer" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView2" Name="Price" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView2" Name="Quant" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView2" Name="Id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Добавить в корзину" />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Редактировать заказы" />
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Удалить заказ" />
            <br />
            <asp:Panel ID="Panel1" runat="server" Height="107px" Visible="False">
                Название товара:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <br />
                Цена:
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <br />
                Количество:
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Добавить" />
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Отменить" />
            </asp:Panel>
            <br />
        </div>
    </form>
</body>
</html>
