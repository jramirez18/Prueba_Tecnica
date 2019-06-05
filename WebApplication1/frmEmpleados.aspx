<%@ Page Title="Empleados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmEmpleados.aspx.cs" Inherits="WebApplication1.frmEmpleados" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Empleados</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtDPI" CssClass="col-md-2 control-label">DPI</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtDPI" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDPI"  maximumvalue="13" minimumvalue="1" Type="Integer"
                    CssClass="text-danger" ErrorMessage="El campo de DPI es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label">Nombre Completo</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
                    CssClass="text-danger" ErrorMessage="El campo de nombre completo es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtTotalHijos" CssClass="col-md-2 control-label">Cantidad de hijos</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtTotalHijos" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTotalHijos" Type="Integer"
                    CssClass="text-danger" ErrorMessage="El campo de cantidad de hijos es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtSalario" CssClass="col-md-2 control-label">Salario</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtSalario" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSalario" Type="Integer"
                    CssClass="text-danger" ErrorMessage="El campo de salario es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="Button1_Click" Text="Calcular" CssClass="btn btn-default" />
                <asp:Button runat="server" OnClick="btnGrabar_Click" Text="Registrar" CssClass="btn btn-default"/>
            </div>
        </div>

        <hr />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtBonoDecreto" CssClass="col-md-2 control-label">Bono decreto</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtBonoDecreto" Text="250" CssClass="form-control" ReadOnly="True"/>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtIGSS" CssClass="col-md-2 control-label">IGSS</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtIGSS" CssClass="form-control" ReadOnly="True"/>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtIRTRA" CssClass="col-md-2 control-label">IRTRA</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtIRTRA" CssClass="form-control" ReadOnly="True"/>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtBonoP" CssClass="col-md-2 control-label">Bono paternal</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtBonoP" CssClass="form-control" ReadOnly="True"/>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtSalarioTotal" CssClass="col-md-2 control-label">Salario total</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtSalarioTotal" CssClass="form-control" ReadOnly="True"/>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtSalarioLiquido" CssClass="col-md-2 control-label" ForeColor="#CC0000">SALARIO LIQUIDO</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtSalarioLiquido"  CssClass="form-control" ReadOnly="True" BackColor="#FFCC00" Font-Bold="True" Font-Size="Large"/>
            </div>
        </div>

    </div>
</asp:Content>
