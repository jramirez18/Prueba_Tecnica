<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>BIENVENIDOS</h1>
    </div>
    <div>

        <asp:gridview ID="GridView1" runat="server" autogeneratecolumns="false" onselectedindexchanged="GridView1_SelectedIndexChanged"  CssClass="mydatagrid" Width="467px">
            <columns>
                <asp:BoundField DataField="id_empleado" HeaderText="ID" />
                <asp:BoundField DataField="dpi" HeaderText="DPI" />
                <asp:BoundField DataField="nombre_completo" HeaderText="Nombre completo" />
                <asp:BoundField DataField="total_hijos" HeaderText="Hijos" />
                <asp:BoundField DataField="salario_base" HeaderText="Salario base" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="selectUno" text="Ver" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="edit" text="Editar" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton text="Eliminar" runat="server" OnClick="GridView1_SelectedIndexChanged"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </columns>
        </asp:gridview>
    </div>



</asp:Content>
