﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChooseRoom.aspx.cs" Inherits="Website.ChooseRoom" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <%--https://xdsoft.net/jqplugins/datetimepicker/ Calendar comes from here--%>
    <div style="margin-top: 10px;">
        <div>
            <input ID="StartDato" runat="server" type="text">
        </div>
        <div>
            <input id="SlutDato" runat="server" type="text" >
        </div>
        <asp:button runat="server" id="VælgDato" Text="Vælg dato" OnClick="VælgDato_Click"></asp:button>
    </div>

    <div style="margin-left: 80%; margin-top: 10px;">
        <asp:Button ID="Filter_Button" runat="server" OnClick="Filter_Button_Click" Text="Filter" />
    </div>

    <div class="row">
        <div style="margin-left: 80%; margin-top: 10px; z-index: 3;">
            <asp:CheckBoxList CssClass="checkbox1" ID="Filter_Checkboxlist" runat="server" Visible="false">
                <asp:ListItem>Enkelteseng</asp:ListItem>
                <asp:ListItem>Dobbeltseng</asp:ListItem>
                <asp:ListItem>2 enkeltesenge</asp:ListItem>
                <asp:ListItem>Altan</asp:ListItem>
                <asp:ListItem>Badekar</asp:ListItem>
                <asp:ListItem>Jacuzzi</asp:ListItem>
                <asp:ListItem>Eget køkken</asp:ListItem>
            </asp:CheckBoxList>
        </div>
    </div>

    <div style="margin-left: 80%; margin-top: 10px;">
        <asp:Button ID="searchButton" runat="server" Text="Søg" OnClick="searchButton_Click"/>
    </div>

    <section>
        <div class="picturelistdiv">
            <%--Måske et link der kunne hjælpe med grid--%>
            <%--https://www.aspsnippets.com/Articles/Display-images-from-SQL-Server-Database-in-ASP.Net-GridView-control.aspx--%> 
            <asp:DataList ID="displayrooms" runat="server" RepeatDirection="Horizontal" CellSpacing="3" RepeatColumns="3">
               <ItemTemplate>
                   <table class="table">
                       <tr>
                           <td>
                               <label style="font-size:large; font-weight:bold;">Room: <%# Eval("pk_room_id") %> </label>
                           </td>
                       </tr>

                       <td>
                           <img src="Pictures/Soveværelse 1.PNG" />
                       </td>

                       <tr>
                           <td>
                                <label>Pris: <%# Eval("price") %></label>
                           </td>
                       </tr>

                       <tr>
                           <td>
                               <!--<a href="RoomDetails.aspx?roomId=<%#Eval("pk_room_id") %>?dateIn=">Book her</a>-->
                               <asp:Button ID="bookhere" runat="server" OnClick="bookhere_Click" CommandName="CheckForBook" CommandArgument='<%#Eval("pk_room_id") %>' Text="Philip er grim"/>                               
                           </td>
                       </tr>
                   </table>
               </ItemTemplate>
           </asp:DataList>
        </div>
    </section>


</asp:Content>
