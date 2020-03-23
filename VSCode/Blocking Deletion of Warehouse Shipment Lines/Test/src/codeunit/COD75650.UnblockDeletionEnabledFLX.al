codeunit 75650 "Unblock Deletion Enabled FLX"
{
    // Generated on 22-3-2020 at 16:04 by Luc van Vugt

    SubType = Test;

    trigger OnRun()
    begin
        // [FEATURE] Unblock Deletion of Whse. Shpt. Line enabled
    end;

    [Test]
    procedure DeleteByUserWithNoAllowanceManuallyCreatedWhseShptLine()
    // [FEATURE] Unblock Deletion of Whse. Shpt. Line enabled
    var
        LocationCode: Code[10];
        WarehouseShipmentNo: Code[20];
    begin
        // [SCENARIO #0001] Delete by user with no allowance manually created whse shpt. line
        Initialize();

        // [GIVEN] Enable "Unblock Deletion of Shpt. Line" on warehouse setup
        EnableUnblockDeletionOfShptLineOnWarehouseSetup();
        // [GIVEN] Location with require shipment
        LocationCode := CreateLocationWithRequireShipment();
        // [GIVEN] Warehouse employee for current user with no allowance
        CreateWarehouseEmployeeForCurrentUserWithNoAllowance(LocationCode);
        // [GIVEN] Manualy created warehouse shipment from released sales order with one line with require shipment location
        WarehouseShipmentNo := CreateManualyCreatedWarehouseShipmentFromReleasedSalesOrderWithOneLineWithRequireShipmentLocation(LocationCode);

        // [WHEN] Delete warehouse shipment line
        DeleteWarehouseShipmentLine(WarehouseShipmentNo);

        // [THEN] Warehouse shipment line is deleted
        VerifyWarehouseShipmentLineIsDeleted(WarehouseShipmentNo);
    end;

    var
        Assert: Codeunit Assert;
        LibrarySales: Codeunit "Library - Sales";
        LibraryWarehouse: Codeunit "Library - Warehouse";
        IsInitialized: Boolean;

    local procedure Initialize()
    var
        LibraryTestInitialize: Codeunit "Library - Test Initialize";
    begin
        LibraryTestInitialize.OnTestInitialize(Codeunit::"Unblock Deletion Enabled FLX");

        if IsInitialized then
            exit;

        LibraryTestInitialize.OnBeforeTestSuiteInitialize(Codeunit::"Unblock Deletion Enabled FLX");

        IsInitialized := true;
        Commit();

        LibraryTestInitialize.OnAfterTestSuiteInitialize(Codeunit::"Unblock Deletion Enabled FLX");
    end;

    local procedure EnableUnblockDeletionOfShptLineOnWarehouseSetup()
    var
        WarehouseSetup: Record "Warehouse Setup";
    begin
        with WarehouseSetup do begin
            if not Get() then
                Insert();
            "Unblock Deletion of Shpt. Line" := true;
            Modify();
        end;
    end;

    local procedure CreateLocationWithRequireShipment(): Code[10]
    var
        Location: Record Location;
    begin
        LibraryWarehouse.CreateLocationWMS(Location, false, false, false, false, true);
        exit(Location.Code);
    end;

    local procedure CreateManualyCreatedWarehouseShipmentFromReleasedSalesOrderWithOneLineWithRequireShipmentLocation(LocationCode: Code[10]): Code[20]
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        LibrarySales.CreateSalesDocumentWithItem(SalesHeader, SalesLine, SalesHeader."Document Type"::Order, '', '', 1, LocationCode, 0D);
        LibrarySales.ReleaseSalesDocument(SalesHeader);

        LibraryWarehouse.CreateWhseShipmentFromSO(SalesHeader);
        exit(GetWarehouseShipmentHeaderNo(SalesHeader."No.", Database::"Sales Line", SalesHeader."Document Type"));
    end;

    local procedure GetWarehouseShipmentHeaderNo(SourceNo: Code[20]; SourceType: Integer; SourceSubtype: Integer): Code[20]
    var
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
    begin
        FindWarehouseShipmentLine(WarehouseShipmentLine, SourceNo, SourceType, SourceSubtype);
        exit(WarehouseShipmentLine."No.");
    end;

    local procedure FindWarehouseShipmentLine(var WarehouseShipmentLine: Record "Warehouse Shipment Line"; SourceNo: Code[20]; SourceType: Integer; SourceSubtype: Integer)
    begin
        with WarehouseShipmentLine do begin
            Setrange("Source Type", SourceType);
            if SourceSubtype >= 0 then
                SetRange("Source Subtype", SourceSubtype);
            Setrange("Source No.", SourceNo);
            FindFirst();
        end;
    end;

    local procedure CreateWarehouseEmployeeForCurrentUserWithNoAllowance(LocationCode: Code[10])
    var
        WarehouseEmployee: Record "Warehouse Employee";
    begin
        LibraryWarehouse.CreateWarehouseEmployee(WarehouseEmployee, LocationCode, false);
    end;

    local procedure DeleteWarehouseShipmentLine(WarehouseShipmentNo: Code[20])
    var
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
    begin
        with WarehouseShipmentLine do begin
            Setrange("No.", WarehouseShipmentNo);
            FindFirst();
            Delete();
        end;
    end;

    local procedure VerifyWarehouseShipmentLineIsDeleted(WarehouseShipmentNo: Code[20])
    var
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
    begin
        with WarehouseShipmentLine do begin
            Setrange("No.", WarehouseShipmentNo);
            Assert.RecordIsEmpty(WarehouseShipmentLine);
        end;
    end;
}