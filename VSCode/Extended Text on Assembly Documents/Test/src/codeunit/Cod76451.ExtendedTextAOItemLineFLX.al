codeunit 76451 "Extended Text AO Item Line FLX"
{
    // Generated on 29/06/2020 at 10:44 by lvanvugt

    Subtype = Test;

    trigger OnRun()
    begin
        // [FEATURE] Extended Text on assembly order/Add item line
        // [FEATURE] Extended Text on assembly order/Delete item line
    end;

    [Test]
    procedure AddToAssemblyOrderLineForItemWithAutomaticExtTextsDisabledAndExtendedTextEnabled()
    // [FEATURE] Extended Text on assembly order/Add item line
    var
        AssemblyDocNo: Code[20];
        ItemNo: Code[20];
    begin
        // [SCENARIO #0001] Add to assembly order line for item with "Automatic Ext. Texts"disabled and extended text enabled
        Initialize();

        // [GIVEN] Item with "Automatic Ext. Texts" disabled and extended text enabled for assembly order
        // CreateItemWithAutomaticExtTextsDisabledAndExtendedTextEnabledForAssemblyOrder();
        ItemNo := CreateItemWithExtendedText(DisableAutomaticExtTexts(), EnableExtTextForAssemblyOrder());
        // [GIVEN] Assembly order
        AssemblyDocNo := CreateAssemblyOrder();

        // [WHEN] Add item line to assembly order
        AddItemLineToAssemblyOrder();

        // [THEN] No extended text lines are added to assembly order
        VerifyNoExtendedTextLinesAreAddedToAssemblyOrder();

    end;

    [Test]
    procedure AddToAssemblyOrderLineForItemWithAutomaticExtTextsEnabledAndExtendedTextEnabled()
    // [FEATURE] Extended Text on assembly order/Add item line
    var
        AssemblyDocNo: Code[20];
        ItemNo: Code[20];
    begin
        // [SCENARIO #0002] Add to assembly order line for item with "Automatic Ext. Texts" enabled and extended text enabled
        Initialize();

        // [GIVEN] Item with "Automatic Ext. Texts" enabled and extended text enabled for assembly order
        // CreateItemWithAutomaticExtTextsEnabledAndExtendedTextEnabledForAssemblyOrder();
        ItemNo := CreateItemWithExtendedText(EnableAutomaticExtTexts(), EnableExtTextForAssemblyOrder());
        // [GIVEN] Assembly order
        AssemblyDocNo := CreateAssemblyOrder();

        // [WHEN] Add item line to assembly order
        AddItemLineToAssemblyOrder();

        // [THEN] Extended text lines are added to assembly order
        VerifyExtendedTextLinesAreAddedToAssemblyOrder();

    end;

    [Test]
    procedure AddToAssemblyOrderLineForItemWithAutomaticExtTextsEnabledAndExtendedTextDisabled()
    // [FEATURE] Extended Text on assembly order/Add item line
    var
        AssemblyDocNo: Code[20];
        ItemNo: Code[20];
    begin
        // [SCENARIO #0067] Add to assembly order line for item with "Automatic Ext. Texts" enabled and extended text disabled
        Initialize();

        // [GIVEN] Item with "Automatic Ext. Texts" enabled and extended text disabled for assembly order
        // CreateItemWithAutomaticExtTextsEnabledAndExtendedTextDisabledForAssemblyOrder();
        ItemNo := CreateItemWithExtendedText(EnableAutomaticExtTexts(), DisableExtTextForAssemblyOrder());
        // [GIVEN] Assembly order
        AssemblyDocNo := CreateAssemblyOrder();

        // [WHEN] Add item line to assembly order
        AddItemLineToAssemblyOrder();

        // [THEN] No extended text lines are added to assembly order
        VerifyNoExtendedTextLinesAreAddedToAssemblyOrder();

    end;

    [Test]
    procedure InsertExtendedTextsForItemWithExtendedTextsOnAssemblyOrderLine()
    // [FEATURE] Extended Text on assembly order/Add item line
    var
        AssemblyDocNo: Code[20];
        ItemNo: Code[20];
    begin
        // [SCENARIO #0003] Insert extended texts for item with extended texts on assembly order line
        Initialize();

        // [GIVEN] Item with "Automatic Ext. Texts" disabled and extended text enabled for assembly order
        // CreateItemWithAutomaticExtTextsDisabledAndExtendedTextEnabledForAssemblyOrder();
        ItemNo := CreateItemWithExtendedText(DisableAutomaticExtTexts(), EnableExtTextForAssemblyOrder());
        // [GIVEN] Assembly order with item line
        AssemblyDocNo := CreateAssemblyOrderWithItemLine();

        // [WHEN] Insert extended text
        InsertExtendedText();

        // [THEN] Extended text lines are added to assembly order
        VerifyExtendedTextLinesAreAddedToAssemblyOrder();

    end;

    [Test]
    procedure InsertExtendedTextsForItemWithNoExtendedTextsOnAssemblyOrderLine()
    // [FEATURE] Extended Text on assembly order/Add item line
    var
        AssemblyDocNo: Code[20];
        ItemNo: Code[20];
    begin
        // [SCENARIO #0004] Insert extended texts for item with no extended texts on assembly order line
        Initialize();

        // [GIVEN] Item with "Automatic Ext. Texts" disabled and extended text disabled for assembly order
        // CreateItemWithAutomaticExtTextsDisabledAndExtendedTextDisabledForAssemblyOrder();
        ItemNo := CreateItemWithExtendedText(DisableAutomaticExtTexts(), DisableExtTextForAssemblyOrder());
        // [GIVEN] Assembly order with item line
        AssemblyDocNo := CreateAssemblyOrderWithItemLine();

        // [WHEN] Insert extended text
        InsertExtendedText();

        // [THEN] No extended text lines are added to assembly order
        VerifyNoExtendedTextLinesAreAddedToAssemblyOrder();

    end;

    [Test]
    procedure InsertExtendedTextsTwiceForItemWithExtendedTextsOnAssemblyOrderLine()
    // [FEATURE] Extended Text on assembly order/Add item line
    var
        AssemblyDocNo: Code[20];
        ItemNo: Code[20];
    begin
        // [SCENARIO #0019] Insert extended texts twice for item with extended texts on assembly order line
        Initialize();

        // [GIVEN] Item with "Automatic Ext. Texts" disabled and extended text enabled for assembly order
        // CreateItemWithAutomaticExtTextsDisabledAndExtendedTextEnabledForAssemblyOrder();
        ItemNo := CreateItemWithExtendedText(DisableAutomaticExtTexts(), EnableExtTextForAssemblyOrder());
        // [GIVEN] Assembly order with item line and extended text inserted
        AssemblyDocNo := CreateAssemblyOrderWithItemLineAndExtendedTextInserted();

        // [WHEN] Insert extended text
        InsertExtendedText();

        // [THEN] No additional extended text lines are added to assembly order
        VerifyNoAdditionalExtendedTextLinesAreAddedToAssemblyOrder();

    end;

    [Test]
    procedure ReplaceItemWithExtendedTextsByItemWithoutExtendedTextsOnAssemblyOrderLine()
    // [FEATURE] Extended Text on assembly order/Add item line
    var
        AssemblyDocNo: Code[20];
        ItemNo: Code[20];
    begin
        // [SCENARIO #0020] Replace item with extended texts by item without extended texts on assembly order line
        Initialize();

        // [GIVEN] Item with "Automatic Ext. Texts" disabled and extended text enabled for assembly order
        // CreateItemWithAutomaticExtTextsDisabledAndExtendedTextEnabledForAssemblyOrder();
        ItemNo := CreateItemWithExtendedText(DisableAutomaticExtTexts(), EnableExtTextForAssemblyOrder());
        // [GIVEN] Assembly order with item line and extended text inserted
        AssemblyDocNo := CreateAssemblyOrderWithItemLineAndExtendedTextInserted();

        // [WHEN] Replace item by item with no extended text
        ReplaceItemByItemWithNoExtendedText();

        // [THEN] Item is replaced and extended text lines are removed
        VerifyItemIsReplacedAndExtendedTextLinesAreRemoved();

    end;

    [Test]
    procedure DeleteItemLineWithExtendedText()
    // [FEATURE] Extended Text on assembly order/Delete item line
    var
        AssemblyDocNo: Code[20];
        ItemNo: Code[20];
    begin
        // [SCENARIO #0005] Delete item line with extended text
        Initialize();

        // [GIVEN] Item with "Automatic Ext. Texts" disabled and extended text enabled for assembly order
        // CreateItemWithAutomaticExtTextsDisabledAndExtendedTextEnabledForAssemblyOrder();
        ItemNo := CreateItemWithExtendedText(DisableAutomaticExtTexts(), EnableExtTextForAssemblyOrder());
        // [GIVEN] Assembly order with item line and extended text inserted
        AssemblyDocNo := CreateAssemblyOrderWithItemLineAndExtendedTextInserted();

        // [WHEN] Delete item line from assembly order
        DeleteItemLineFromAssemblyOrder();

        // [THEN] Item  and extended text lines are removed
        VerifyItemAndExtendedTextLinesAreRemoved();

    end;

    local procedure Initialize()
    var
        LibraryTestInitialize: Codeunit "Library - Test Initialize";
    begin
        LibraryTestInitialize.OnTestInitialize(Codeunit::"Extended Text AO Item Line FLX");

        if IsInitialized then
            exit;

        LibraryTestInitialize.OnBeforeTestSuiteInitialize(Codeunit::"Extended Text AO Item Line FLX");

        IsInitialized := true;
        Commit();

        LibraryTestInitialize.OnAfterTestSuiteInitialize(Codeunit::"Extended Text AO Item Line FLX");
    end;

    local procedure AddItemLineToAssemblyOrder()
    begin
        Error('AddItemLineToAssemblyOrder not implemented.')
    end;

    local procedure CreateAssemblyOrder(): Code[20]
    var
        AssemblyHeader: Record "Assembly Header";
    begin
        AssemblyHeader."Document Type" := AssemblyHeader."Document Type"::Order;
        AssemblyHeader.Insert(true);
        exit(AssemblyHeader."No.");
    end;

    local procedure CreateAssemblyOrderWithItemLine(): Code[20]
    var
        AssemblyHeader: Record "Assembly Header";
    begin
        LibraryAssembly.CreateAssemblyHeader(AssemblyHeader, WorkDate(), '', '', 1, '');
        exit(AssemblyHeader."No.");
    end;

    local procedure CreateAssemblyOrderWithItemLineAndExtendedTextInserted(): Code[20]
    begin
        Error('CreateAssemblyOrderWithItemLineAndExtendedTextInserted not implemented.')
    end;

    local procedure CreateItemWithExtendedText(AutomaticExtTextsEnabled: Boolean; AssemblyDocumentType: Option " ",Order,Quote,"Blanket Order"): Code[20]
    begin
        exit(LibraryExtTextAssDoc.CreateItemWithExtendedText(AutomaticExtTextsEnabled, AssemblyDocumentType));
    end;

    // local procedure CreateItemWithAutomaticExtTextsDisabledAndExtendedTextDisabledForAssemblyOrder(): Code[20]
    // var
    //     Item: Record Item;
    //     ItemNo: Code[20];
    // begin
    //     ItemNo := LibraryExtTextAssDoc.CreateItemWithExtendedText(false, 0); // 0 = enable ext. text for no assembly doc
    //     exit(ItemNo);
    // end;

    // local procedure CreateItemWithAutomaticExtTextsDisabledAndExtendedTextEnabledForAssemblyOrder(): Code[20]
    // begin
    //     exit(LibraryExtTextAssDoc.CreateItemWithExtendedText(false, 1)); // 1 = enable ext. text for assembly order
    // end;

    // local procedure CreateItemWithAutomaticExtTextsEnabledAndExtendedTextDisabledForAssemblyOrder()
    // begin
    //     Error('CreateItemWithAutomaticExtTextsEnabledAndExtendedTextDisabledForAssemblyOrder not implemented.')
    // end;

    // local procedure CreateItemWithAutomaticExtTextsEnabledAndExtendedTextEnabledForAssemblyOrder()
    // begin
    //     Error('CreateItemWithAutomaticExtTextsEnabledAndExtendedTextEnabledForAssemblyOrder not implemented.')
    // end;

    local procedure DeleteItemLineFromAssemblyOrder()
    begin
        Error('DeleteItmLineFromAssemblyOrder not implemented.')
    end;

    local procedure InsertExtendedText()
    begin
        Error('InsertExtendedText not implemented.')
    end;

    local procedure ReplaceItemByItemWithNoExtendedText()
    begin
        Error('ReplaceItemByItemWithNoExtendedText not implemented.')
    end;

    local procedure VerifyExtendedTextLinesAreAddedToAssemblyOrder()
    begin
        Error('VerifyExtendedTextLinesAreAddedToAssemblyOrder not implemented.')
    end;

    local procedure VerifyItemAndExtendedTextLinesAreRemoved()
    begin
        Error('VerifyItemAndExtendedTextLinesAreRemoved not implemented.')
    end;

    local procedure VerifyItemIsReplacedAndExtendedTextLinesAreRemoved()
    begin
        Error('VerifyItemIsReplacedAndExtendedTextLinesAreRemoved not implemented.')
    end;

    local procedure VerifyNoAdditionalExtendedTextLinesAreAddedToAssemblyOrder()
    begin
        Error('VerifyNoAdditionalExtendedTextLinesAreAddedToAssemblyOrder not implemented.')
    end;

    local procedure VerifyNoExtendedTextLinesAreAddedToAssemblyOrder()
    begin
        Error('VerifyNoExtendedTextLinesAreAddedToAssemblyOrder not implemented.')
    end;

    local procedure DisableAutomaticExtTexts(): Boolean
    begin
        exit(false);
    end;

    local procedure EnableAutomaticExtTexts(): Boolean
    begin
        exit(false);
    end;

    local procedure DisableExtTextForAssemblyOrder(): Integer
    begin
        exit(0);
    end;

    local procedure EnableExtTextForAssemblyOrder(): Integer
    begin
        exit(1);
    end;

    var
        Assert: Codeunit Assert;
        LibraryAssembly: Codeunit "Library - Assembly";
        LibraryExtTextAssDoc: Codeunit "Library - Ext Text Ass Doc FLX";
        IsInitialized: Boolean;

}