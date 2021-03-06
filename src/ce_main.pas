unit ce_main;

{$I ce_defines.inc}

interface

uses
  Classes, SysUtils, FileUtil, SynEditKeyCmds, SynHighlighterLFM, Forms, StdCtrls,
  AnchorDocking, AnchorDockStorage, AnchorDockOptionsDlg, Controls, Graphics, strutils,
  Dialogs, Menus, ActnList, ExtCtrls, process, XMLPropStorage, SynExportHTML,
  ce_common, ce_dmdwrap, ce_nativeproject, ce_dcd, ce_synmemo, ce_writableComponent,
  ce_widget, ce_messages, ce_interfaces, ce_editor, ce_projinspect, ce_projconf,
  ce_search, ce_miniexplorer, ce_libman, ce_libmaneditor, ce_todolist, ce_observer,
  ce_toolseditor, ce_procinput, ce_optionseditor, ce_symlist, ce_mru, ce_processes,
  ce_infos, ce_dubproject, ce_dialogs, ce_dubprojeditor, ce_gdb;

type

  TCEApplicationOptions = class;

  { TCEMainForm }
  TCEMainForm = class(TForm, ICEMultiDocObserver, ICEEditableShortCut, ICEProjectObserver)
    actFileCompAndRun: TAction;
    actFileSaveAll: TAction;
    actFileClose: TAction;
    actFileAddToProj: TAction;
    actFileNewRun: TAction;
    actFileNew: TAction;
    actFileOpen: TAction;
    actFileSaveAs: TAction;
    actFileSave: TAction;
    actFileCompAndRunWithArgs: TAction;
    actEdFind: TAction;
    actEdFindNext: TAction;
    actFileOpenContFold: TAction;
    actFileHtmlExport: TAction;
    actFileUnittest: TAction;
    actFileCompileAndRunOut: TAction;
    actProjNewDubJson: TAction;
    actProjNewNative: TAction;
    actSetRunnableSw: TAction;
    actLayoutSave: TAction;
    actProjOpenContFold: TAction;
    actProjOptView: TAction;
    actProjSource: TAction;
    actProjRun: TAction;
    actProjRunWithArgs: TAction;
    actProjCompile: TAction;
    actProjCompileAndRun: TAction;
    actProjCompAndRunWithArgs: TAction;
    actProjClose: TAction;
    actProjOpts: TAction;
    actProjOpen: TAction;
    actProjSave: TAction;
    actProjSaveAs: TAction;
    actEdMacPlay: TAction;
    actEdMacStartStop: TAction;
    actEdCut: TAction;
    actEdRedo: TAction;
    actEdUndo: TAction;
    actEdPaste: TAction;
    actEdCopy: TAction;
    actEdIndent: TAction;
    actEdUnIndent: TAction;
    Actions: TActionList;
    ApplicationProperties1: TApplicationProperties;
    imgList: TImageList;
    mainMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    MenuItem58: TMenuItem;
    MenuItem59: TMenuItem;
    MenuItem60: TMenuItem;
    MenuItem61: TMenuItem;
    MenuItem62: TMenuItem;
    MenuItem63: TMenuItem;
    MenuItem64: TMenuItem;
    MenuItem65: TMenuItem;
    MenuItem66: TMenuItem;
    MenuItem67: TMenuItem;
    MenuItem68: TMenuItem;
    MenuItem69: TMenuItem;
    MenuItem70: TMenuItem;
    mnuLayout: TMenuItem;
    mnuItemMruFile: TMenuItem;
    mnuItemMruProj: TMenuItem;
    mnuItemWin: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    procedure actProjNewDubJsonExecute(Sender: TObject);
    procedure actProjNewNativeExecute(Sender: TObject);
    procedure actSetRunnableSwExecute(Sender: TObject);
    procedure updateDocumentBasedAction(sender: TObject);
    procedure updateProjectBasedAction(sender: TObject);
    procedure updateDocEditBasedAction(sender: TObject);
    procedure actFileCompileAndRunOutExecute(Sender: TObject);
    procedure actEdFindExecute(Sender: TObject);
    procedure actEdFindNextExecute(Sender: TObject);
    procedure actFileAddToProjExecute(Sender: TObject);
    procedure actFileCloseExecute(Sender: TObject);
    procedure actFileCompAndRunExecute(Sender: TObject);
    procedure actFileCompAndRunWithArgsExecute(Sender: TObject);
    procedure actFileHtmlExportExecute(Sender: TObject);
    procedure actFileOpenContFoldExecute(Sender: TObject);
    procedure actFileSaveAllExecute(Sender: TObject);
    procedure actEdIndentExecute(Sender: TObject);
    procedure actFileUnittestExecute(Sender: TObject);
    procedure actLayoutSaveExecute(Sender: TObject);
    procedure actProjCompAndRunWithArgsExecute(Sender: TObject);
    procedure actProjCompileAndRunExecute(Sender: TObject);
    procedure actProjCompileExecute(Sender: TObject);
    procedure actEdCopyExecute(Sender: TObject);
    procedure actEdCutExecute(Sender: TObject);
    procedure ActionsUpdate(AAction: TBasicAction; var Handled: Boolean);
    procedure actEdMacPlayExecute(Sender: TObject);
    procedure actEdMacStartStopExecute(Sender: TObject);
    procedure actFileNewExecute(Sender: TObject);
    procedure actFileNewRunExecute(Sender: TObject);
    procedure actFileOpenExecute(Sender: TObject);
    procedure actProjOpenContFoldExecute(Sender: TObject);
    procedure actProjOpenExecute(Sender: TObject);
    procedure actEdPasteExecute(Sender: TObject);
    procedure actProjCloseExecute(Sender: TObject);
    procedure actProjOptsExecute(Sender: TObject);
    procedure actEdRedoExecute(Sender: TObject);
    procedure actFileSaveAsExecute(Sender: TObject);
    procedure actFileSaveExecute(Sender: TObject);
    procedure actProjOptViewExecute(Sender: TObject);
    procedure actProjRunExecute(Sender: TObject);
    procedure actProjRunWithArgsExecute(Sender: TObject);
    procedure actProjSaveAsExecute(Sender: TObject);
    procedure actProjSaveExecute(Sender: TObject);
    procedure actEdUndoExecute(Sender: TObject);
    procedure actProjSourceExecute(Sender: TObject);
    procedure actEdUnIndentExecute(Sender: TObject);
    procedure ApplicationProperties1Exception(Sender: TObject; E: Exception);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);

  protected

    procedure DoShow; override;

  private

    fDoc: TCESynMemo;
    fActionHandler: TCEActionProviderSubject;
    fMultidoc: ICEMultiDocHandler;
    fScCollectCount: Integer;
    fUpdateCount: NativeInt;
    fProjectInterface: ICECommonProject;
    fDubProject: TCEDubProject;
    fNativeProject: TCENativeProject;
    fProjMru: TCEMRUProjectList;
    fFileMru: TCEMRUDocumentList;
    fWidgList: TCEWidgetList;
    fMesgWidg: TCEMessagesWidget;
    fEditWidg: TCEEditorWidget;
    fProjWidg: TCEProjectInspectWidget;
    fPrjCfWidg: TCEProjectConfigurationWidget;
    fFindWidg:  TCESearchWidget;
    fExplWidg: TCEMiniExplorerWidget;
    fLibMWidg: TCELibManEditorWidget;
    fTlsEdWidg: TCEToolsEditorWidget;
    fPrInpWidg: TCEProcInputWidget;
    fTodolWidg: TCETodoListWidget;
    fOptEdWidg: TCEOptionEditorWidget;
    fSymlWidg: TCESymbolListWidget;
    fInfoWidg: TCEInfoWidget;
    fDubProjWidg: TCEDubProjectEditorWidget;
    fGdbWidg: TCEGdbWidget;

    fFirstShown: boolean;
    fProjFromCommandLine: boolean;
    fInitialized: boolean;
    fRunnableSw: string;
    fRunProc: TCEProcess;
    fMsgs: ICEMessagesDisplay;
    fMainMenuSubj: TCEMainMenuSubject;
    fAppliOpts: TCEApplicationOptions;
    procedure updateMainMenuProviders;
    procedure updateFloatingWidgetOnTop(onTop: boolean);

    // action provider handling;
    procedure clearActProviderEntries;
    procedure collectedActProviderEntries;

    // ICEMultiDocObserver
    procedure docNew(aDoc: TCESynMemo);
    procedure docClosing(aDoc: TCESynMemo);
    procedure docFocused(aDoc: TCESynMemo);
    procedure docChanged(aDoc: TCESynMemo);

    // ICEProjectObserver
    procedure projNew(aProject: ICECommonProject);
    procedure projChanged(aProject: ICECommonProject);
    procedure projClosing(aProject: ICECommonProject);
    procedure projFocused(aProject: ICECommonProject);
    procedure projCompiling(aProject: ICECommonProject);

    // ICEEditableShortcut
    function scedWantFirst: boolean;
    function scedWantNext(out category, identifier: string; out aShortcut: TShortcut): boolean;
    procedure scedSendItem(const category, identifier: string; aShortcut: TShortcut);

    //Init - Fina
    procedure getCMdParams;
    procedure checkCompilo;
    procedure InitMRUs;
    procedure InitWidgets;
    procedure InitDocking;
    procedure LoadSettings;
    procedure SaveSettings;
    procedure LoadDocking;
    procedure SaveDocking;
    procedure LoadLastDocsAndProj;
    procedure SaveLastDocsAndProj;
    procedure FreeRunnableProc;

    // widget interfaces subroutines
    procedure updateWidgetMenuEntry(sender: TObject);
    procedure widgetShowFromAction(sender: TObject);

    // run & exec sub routines
    procedure asyncprocOutput(sender: TObject);
    procedure asyncprocTerminate(sender: TObject);
    procedure compileAndRunFile(unittest: boolean = false; redirect: boolean = true;
      const runArgs: string = '');

    // file sub routines
    procedure newFile;
    procedure saveFile(aDocument: TCESynMemo);
    procedure openFile(const aFilename: string);

    // project sub routines
    procedure saveProjSource(const aEditor: TCESynMemo);
    procedure newNativeProj;
    procedure newDubProj;
    procedure saveProj;
    procedure saveProjAs(const aFilename: string);
    procedure openProj(const aFilename: string);
    procedure closeProj;
    procedure showProjTitle;

    // mru
    procedure mruChange(Sender: TObject);
    procedure mruFileItemClick(Sender: TObject);
    procedure mruProjItemClick(Sender: TObject);
    procedure mruClearClick(Sender: TObject);

    // layout
    procedure layoutMnuItemClick(sender: TObject);
    procedure layoutLoadFromFile(const aFilename: string);
    procedure layoutSaveToFile(const aFilename: string);
    procedure layoutUpdateMenu;

  public
    constructor create(aOwner: TComponent); override;
    destructor destroy; override;
    procedure UpdateDockCaption(Exclude: TControl = nil); override;
  end;

  TCEPersistentMainShortcuts = class(TWritableLfmTextComponent)
  private
    fCol: TCollection;
    procedure setCol(aValue: TCollection);
  published
    property shortcut: TCollection read fCol write setCol;
  public
    constructor create(aOwner: TComponent); override;
    destructor destroy; override;
    //
    procedure assign(aValue: TPersistent); override;
    procedure assignTo(aValue: TPersistent); override;
  end;

  TCEPersistentMainMrus = class(TWritableLfmTextComponent)
  private
    fProjMruPt: TCEMRUFileList;
    fFileMruPt: TCEMRUFileList;
    procedure setProjMru(aValue: TCEMRUFileList);
    procedure setFileMru(aValue: TCEMRUFileList);
  published
    property mostRecentFiles: TCEMRUFileList read fFileMruPt write setFileMru;
    property mostRecentprojects: TCEMRUFileList read fProjMruPt write setProjMru;
  public
    procedure setTargets(projs: TCEMRUFileList; files: TCEMRUFileList);
  end;

  TCELastDocsAndProjs = class(TWritableLfmTextComponent)
  private
    fDocuments: TStringList;
    fProject: string;
    //fProjectGRoup: string;
    procedure setDocuments(aValue: TStringList);
  protected
    procedure beforeSave; override;
    procedure afterLoad; override;
  published
    property documents: TStringList read fDocuments write setDocuments;
    property project: string read fProject write fProject;
    // property projectGroup: string read fProjectGroup write fProjectGroup;
  public
    constructor create(aOwner: TComponent); override;
    destructor destroy; override;
    procedure Assign(aSource: TPersistent); override;
    procedure AssignTo(aDestination: TPersistent); override;
  end;

  TCEApplicationOptionsBase = class(TWritableLfmTextComponent)
  private
    fFloatingWidgetOnTop: boolean;
    fReloadLastDocuments: boolean;
    fMaxRecentProjs: integer;
    fMaxRecentDocs: integer;
  published
    property floatingWidgetOnTop: boolean read fFloatingWidgetOnTop write fFloatingWidgetOnTop;
    property reloadLastDocuments: boolean read fReloadLastDocuments write fReloadLastDocuments;
    property maxRecentProjects: integer read fMaxRecentProjs write fMaxRecentProjs;
    property maxRecentDocuments: integer read fMaxRecentDocs write fMaxRecentDocs;
  end;

  TCEApplicationOptions = class(TCEApplicationOptionsBase, ICEEditableOptions)
  private
    fBackup:TCEApplicationOptionsBase;
    //
    function optionedWantCategory(): string;
    function optionedWantEditorKind: TOptionEditorKind;
    function optionedWantContainer: TPersistent;
    procedure optionedEvent(anEvent: TOptionEditorEvent);
    function optionedOptionsModified: boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure assign(src: TPersistent); override;
    procedure assignTo(dst: TPersistent); override;
  end;

var
  CEMainForm: TCEMainForm;

implementation
{$R *.lfm}

uses
  SynMacroRecorder, ce_symstring;

{$REGION TCEApplicationOptions ------------------------------------------------------}
constructor TCEApplicationOptions.Create(AOwner: TComponent);
begin
  inherited;
  fBackup := TCEApplicationOptionsBase.Create(self);
  EntitiesConnector.addObserver(self);
end;

destructor TCEApplicationOptions.Destroy;
begin
  EntitiesConnector.removeObserver(self);
  inherited;
end;

procedure TCEApplicationOptions.assign(src: TPersistent);
begin
  if src = CEMainForm then
  begin
    fMaxRecentProjs:= CEMainForm.fProjMru.maxCount;
    fMaxRecentDocs:= CEMainForm.fFileMru.maxCount;
  end else if src = fBackup then
  begin
    fMaxRecentDocs:= fBackup.fMaxRecentDocs;
    fMaxRecentProjs:= fBackup.fMaxRecentProjs;
    fReloadLastDocuments:=fBackup.fReloadLastDocuments;
    fFloatingWidgetOnTop := fBackup.fFloatingWidgetOnTop;
  end
  else inherited;
end;

procedure TCEApplicationOptions.assignTo(dst: TPersistent);
begin
  if dst = CEMainForm then
  begin
   CEMainForm.fProjMru.maxCount := fMaxRecentProjs;
   CEMainForm.fFileMru.maxCount := fMaxRecentDocs;
   CEMainForm.updateFloatingWidgetOnTop(fFloatingWidgetOnTop);
  end else if dst = fBackup then
  begin
    fBackup.fMaxRecentDocs:= fMaxRecentDocs;
    fBackup.fMaxRecentProjs:= fMaxRecentProjs;
    fBackup.fReloadLastDocuments:=fReloadLastDocuments;
    fBackup.fFloatingWidgetOnTop:=fFloatingWidgetOnTop;
  end
  else inherited;
end;

function TCEApplicationOptions.optionedWantCategory(): string;
begin
  exit('Application');
end;

function TCEApplicationOptions.optionedWantEditorKind: TOptionEditorKind;
begin
  exit(oekGeneric);
end;

function TCEApplicationOptions.optionedWantContainer: TPersistent;
begin
  AssignTo(fBackup);
  exit(self);
end;

procedure TCEApplicationOptions.optionedEvent(anEvent: TOptionEditorEvent);
begin
  case anEvent of
    oeeCancel: begin Assign(fBackup); AssignTo(CEMainForm); end;
    oeeAccept: begin AssignTo(CEMainForm); AssignTo(fBackup);end;
    oeeSelectCat: begin Assign(CEMainForm); AssignTo(fBackup); end;
    oeeChange: AssignTo(CEMainForm);
  end;
end;

function TCEApplicationOptions.optionedOptionsModified: boolean;
begin
  exit(false);
end;
{$ENDREGION}

{$REGION TCELastDocsAndProjs ---------------------------------------------------}
constructor TCELastDocsAndProjs.create(aOwner: TComponent);
begin
  inherited;
  fDocuments := TStringList.Create;
end;

destructor TCELastDocsAndProjs.destroy;
begin
  fDocuments.Free;
  inherited;
end;

procedure TCELastDocsAndProjs.Assign(aSource: TPersistent);
var
  itf: ICECommonProject = nil;
begin
  if aSource is TCEMainForm then
  begin
    itf := TCEMainForm(aSource).fProjectInterface;
    if itf = nil then exit;
    fProject := itf.filename;
  end else
    inherited;
end;

procedure TCELastDocsAndProjs.AssignTo(aDestination: TPersistent);
var
  itf: ICECommonProject = nil;
begin
  if aDestination is TCEMainForm then
  begin
    if TCEMainForm(aDestination).fProjFromCommandLine then
      exit;
    itf := TCEMainForm(aDestination).fProjectInterface;
    if (itf <> nil) and (itf.filename = fProject) then
      exit;
    if fProject <> '' then if FileExists(fProject) then
      TCEMainForm(aDestination).openProj(fProject);
  end else
    inherited;
end;

procedure TCELastDocsAndProjs.setDocuments(aValue: TStringList);
begin
  fDocuments.Assign(aValue);
end;

procedure TCELastDocsAndProjs.beforeSave;
var
  i: integer;
  mdh: ICEMultiDocHandler;
  str: string;
begin
  mdh := getMultiDocHandler;
  if mdh = nil then exit;
  for i:= 0 to mdh.documentCount-1 do
  begin
    str := mdh.document[i].fileName;
    if str <> mdh.document[i].tempFilename then
      if FileExists(str) then
        fDocuments.Add(str);
  end;
end;

procedure TCELastDocsAndProjs.afterLoad;
var
  mdh: ICEMultiDocHandler;
  str: string;
begin
  mdh := getMultiDocHandler;
  if mdh = nil then exit;
  for str in fDocuments do
    if FileExists(str) then
      mdh.openDocument(str);
  // TODO-cbugfix: if project file is reloaded to an editor it won't be linked to the matching project (e.g save file and project editor widget directly updated)
  // same with MRU file or mini-explorer.
end;
{$ENDREGION}

{$REGION Actions shortcuts -----------------------------------------------------}
constructor TCEPersistentMainShortcuts.create(aOwner: TComponent);
begin
  inherited;
  fCol := TCollection.Create(TCEPersistentShortcut);
end;

destructor TCEPersistentMainShortcuts.destroy;
begin
  fCol.Free;
  inherited;
end;

procedure TCEPersistentMainShortcuts.setCol(aValue: TCollection);
begin
  fCol.Assign(aValue);
end;

procedure TCEPersistentMainShortcuts.assign(aValue: TPersistent);
var
  itm: TCEPersistentShortcut;
  i: Integer;
begin
  fCol.Clear;
  if aValue = CEMainForm then
    for i := 0 to CEMainForm.Actions.ActionCount-1 do
    begin
      if CEMainForm.Actions.Actions[i].Owner <> CEMainForm then
        continue;
      itm := TCEPersistentShortcut(fCol.Add);
      itm.shortcut := TAction(CEMainForm.Actions.Actions[i]).Shortcut;
      itm.actionName := CEMainForm.Actions.Actions[i].Name;
    end
  else inherited;
end;

procedure TCEPersistentMainShortcuts.assignTo(aValue: TPersistent);
var
  itm: TCEPersistentShortcut;
  i, j: Integer;
begin
  if aValue = CEMainForm then
    for i:= 0 to fCol.Count-1 do
    begin
      itm := TCEPersistentShortcut(fCol.Items[i]);
      for j := 0 to CEMainForm.Actions.ActionCount-1 do
        if CEMainForm.Actions.Actions[i].Name = itm.actionName then
        begin
          TAction(CEMainForm.Actions.Actions[i]).Shortcut := itm.shortcut;
          break;
        end;
    end
  else inherited;
end;
{$ENDREGION}

{$REGION TCEPersistentMainMrus -------------------------------------------------}
procedure TCEPersistentMainMrus.setProjMru(aValue: TCEMRUFileList);
begin
  fProjMruPt.assign(aValue);
end;

procedure TCEPersistentMainMrus.setFileMru(aValue: TCEMRUFileList);
begin
  fFileMruPt.assign(aValue);
end;

procedure TCEPersistentMainMrus.setTargets(projs: TCEMRUFileList; files: TCEMRUFileList);
begin
  fFileMruPt := files;
  fProjMruPt := projs;
end;
{$ENDREGION}

{$REGION Standard Comp/Obj------------------------------------------------------}
constructor TCEMainForm.create(aOwner: TComponent);
begin
  inherited create(aOwner);
  fMainMenuSubj := TCEMainMenuSubject.create;
  fActionHandler := TCEActionProviderSubject.create;
  //
  EntitiesConnector.addObserver(self);
  //
  InitMRUs;
  InitWidgets;
  InitDocking;
  LoadSettings;
  layoutUpdateMenu;
  fMultidoc := getMultiDocHandler;
  //
  checkCompilo;
  //
  updateMainMenuProviders;
  EntitiesConnector.forceUpdate;
  //
  getCMdParams;
  if fNativeProject = nil then newNativeProj;
  //
  fInitialized := true;
end;

procedure TCEMainForm.checkCompilo;
const
  msg = 'Coedit requires DMD to be setup on this system' + LineEnding +
    'If DMD is setup please add it to the system PATH variable before using Coedit';
begin
  if exeInSysPath('dmd') then
    exit;
  dlgOkError(msg);
  close;
end;

procedure TCEMainForm.getCMdParams;
var
  value: string;
  lst: TStringList;
begin
  if application.ParamCount > 0 then
  begin
    value := application.Params[1];
    if value <> '' then
    begin
      lst := TStringList.Create;
      try
        lst.DelimitedText := value;
        for value in lst do
        begin
          if value = '' then continue;
          if isEditable(ExtractFileExt(value)) then
            openFile(value)
          else if isValidNativeProject(value) or isValidDubProject(value) then
          begin
            // so far CE can only open 1 project at a time
            openProj(value);
            fProjFromCommandLine := true;
            break;
          end
        end;
      finally
        lst.Free;
      end;
    end;
  end;
  value := application.GetOptionValue('p', 'project');
  if (value <> '') and fileExists(value) then
    openProj(value);
  value := application.GetOptionValue('f', 'files');
  if value <> '' then
  begin
    lst := TStringList.Create;
    try
      lst.DelimitedText := value;
      for value in lst do
      begin
        if fileExists(value) then
          openFile(value);
      end;
    finally
      lst.Free;
    end;
  end;
end;

procedure TCEMainForm.InitMRUs;
begin
  fProjMru := TCEMRUProjectList.Create;
  fFileMru := TCEMRUDocumentList.Create;
  fProjMru.objectTag := mnuItemMruProj;
  fFileMru.objectTag := mnuItemMruFile;
  fProjMru.OnChange := @mruChange;
  fFileMru.OnChange := @mruChange;
end;

procedure TCEMainForm.InitWidgets;
var
  widg: TCEWidget;
  act: TAction;
  itm: TMenuItem;
begin
  fWidgList := TCEWidgetList.Create;
  fMesgWidg := TCEMessagesWidget.create(self);
  fEditWidg := TCEEditorWidget.create(self);
  fProjWidg := TCEProjectInspectWidget.create(self);
  fPrjCfWidg:= TCEProjectConfigurationWidget.create(self);
  fFindWidg := TCESearchWidget.create(self);
  fExplWidg := TCEMiniExplorerWidget.create(self);
  fLibMWidg := TCELibManEditorWidget.create(self);
  fTlsEdWidg:= TCEToolsEditorWidget.create(self);
  fPrInpWidg:= TCEProcInputWidget.create(self);
  fTodolWidg:= TCETodoListWidget.create(self);
  fOptEdWidg:= TCEOptionEditorWidget.create(self);
  fSymlWidg := TCESymbolListWidget.create(self);
  fInfoWidg := TCEInfoWidget.create(self);
  fDubProjWidg:= TCEDubProjectEditorWidget.create(self);
  fGdbWidg  := TCEGdbWidget.create(self);

  getMessageDisplay(fMsgs);

  fWidgList.addWidget(@fMesgWidg);
  fWidgList.addWidget(@fEditWidg);
  fWidgList.addWidget(@fProjWidg);
  fWidgList.addWidget(@fPrjCfWidg);
  fWidgList.addWidget(@fFindWidg);
  fWidgList.addWidget(@fExplWidg);
  fWidgList.addWidget(@fLibMWidg);
  fWidgList.addWidget(@fTlsEdWidg);
  fWidgList.addWidget(@fPrInpWidg);
  fWidgList.addWidget(@fTodolWidg);
  fWidgList.addWidget(@fOptEdWidg);
  fWidgList.addWidget(@fSymlWidg);
  fWidgList.addWidget(@fInfoWidg);
  fWidgList.addWidget(@fDubProjWidg);
  fWidgList.addWidget(@fGdbWidg);
  fWidgList.sort(@CompareWidgCaption);

  for widg in fWidgList do
  begin
    act := TAction.Create(self);
    act.Category := 'Window';
    act.Caption := widg.Caption;
    act.OnExecute := @widgetShowFromAction;
    act.Tag := ptrInt(widg);
    act.ImageIndex := 25;
    act.OnUpdate:= @updateWidgetMenuEntry;
    itm := TMenuItem.Create(self);
    itm.Action := act;
    itm.Tag := ptrInt(widg);
    mnuItemWin.Add(itm);
  end;
end;

procedure TCEMainForm.InitDocking;
var
  i: Integer;
  widg: TCEWidget;
  aManager: TAnchorDockManager;
begin
  DockMaster.MakeDockSite(Self, [akBottom], admrpChild);
  DockMaster.OnShowOptions := @ShowAnchorDockOptions;
  DockMaster.HeaderStyle := adhsPoints;
  DockMaster.HideHeaderCaptionFloatingControl := true;

  // this is a fix copied from Laz, seems to force the space between the menu and the UI stay 0.
  if DockManager is TAnchorDockManager then begin
    aManager:=TAnchorDockManager(DockManager);
    aManager.PreferredSiteSizeAsSiteMinimum:=false;
  end;

  // makes widget dockable
  for i := 0 to fWidgList.Count-1 do
  begin
    widg := fWidgList.widget[i];
    if not widg.isDockable then continue;
    DockMaster.MakeDockable(widg, true);
    DockMaster.GetAnchorSite(widg).Header.HeaderPosition := adlhpTop;
  end;

  // load existing or default docking
  if FileExists(getCoeditDocPath + 'docking.xml') then LoadDocking
  else begin
    Height := 0;
    // center
    DockMaster.ManualDock(DockMaster.GetAnchorSite(fEditWidg), DockMaster.GetSite(Self), alBottom);
    DockMaster.ManualDock(DockMaster.GetAnchorSite(fMesgWidg), DockMaster.GetSite(fEditWidg), alBottom);
    DockMaster.ManualDock(DockMaster.GetAnchorSite(fPrInpWidg), DockMaster.GetSite(fMesgWidg), alBottom);
    // left
    DockMaster.GetAnchorSite(fSymlWidg).Width := 200;
    DockMaster.GetAnchorSite(fFindWidg).Width := 200;
    DockMaster.ManualDock(DockMaster.GetAnchorSite(fSymlWidg), DockMaster.GetSite(fEditWidg), alLeft);
    DockMaster.ManualDock(DockMaster.GetAnchorSite(fFindWidg), DockMaster.GetAnchorSite(fSymlWidg), alBottom, fSymlWidg);
    // right
    DockMaster.GetAnchorSite(fProjWidg).Width := 250;
    DockMaster.GetAnchorSite(fPrjCfWidg).Width := 250;
    DockMaster.ManualDock(DockMaster.GetAnchorSite(fProjWidg), DockMaster.GetSite(fEditWidg), alRight);
    DockMaster.ManualDock(DockMaster.GetAnchorSite(fPrjCfWidg), DockMaster.GetAnchorSite(fProjWidg), alBottom, fProjWidg);
    // close remaining and header to top
    for i := 0 to fWidgList.Count-1 do
    begin
      widg := fWidgList.widget[i];
      if not widg.isDockable then continue;
      DockMaster.GetAnchorSite(widg).Header.HeaderPosition := adlhpTop;
      if not DockMaster.GetAnchorSite(widg).HasParent then
        DockMaster.GetAnchorSite(widg).Close
    end;
  end;
end;

procedure TCEMainForm.LoadSettings;
var
  fname: string;
begin
  // project and files MRU
  fname := getCoeditDocPath + 'mostrecent.txt';
  if fileExists(fname) then with TCEPersistentMainMrus.create(nil) do
  try
    setTargets(fFileMru, fProjMru);
    loadFromFile(fname);
  finally
    Free;
  end;
  // shortcuts for the actions standing in the main action list
  fname := getCoeditDocPath + 'mainshortcuts.txt';
  if fileExists(fname) then with TCEPersistentMainShortcuts.create(nil) do
  try
    loadFromFile(fname);
    assignTo(self);
  finally
    Free;
  end;
  // globals opts
  fAppliOpts := TCEApplicationOptions.Create(self);
  fname := getCoeditDocPath + 'application.txt';
  if fileExists(fname) then
  begin
    fAppliOpts.loadFromFile(fname);
    fAppliOpts.assignTo(self);
  end;
end;

procedure TCEMainForm.SaveSettings;
begin
  if not fInitialized then
    exit;
  // project and files MRU
  with TCEPersistentMainMrus.create(nil) do
  try
    setTargets(fFileMru, fProjMru);
    saveToFile(getCoeditDocPath + 'mostrecent.txt');
  finally
    Free;
  end;
  // shortcuts for the actions standing in the main action list
  with TCEPersistentMainShortcuts.create(nil) do
  try
    assign(self);
    saveToFile(getCoeditDocPath + 'mainshortcuts.txt');
  finally
    Free;
  end;
  // globals opts
  fAppliOpts.assign(self);
  fAppliOpts.saveToFile(getCoeditDocPath + 'application.txt');
end;

procedure TCEMainForm.SaveDocking;
var
  xcfg: TXMLConfigStorage;
  i: NativeInt;
begin
  if not fInitialized then exit;
  if not Visible then exit;
  //
  DockMaster.RestoreLayouts.Clear;
  if WindowState = wsMinimized then WindowState := wsNormal;
  // does not save minimized/undocked windows to prevent bugs
  for i:= 0 to fWidgList.Count-1 do
  begin
    if not fWidgList.widget[i].isDockable then continue;
    if DockMaster.GetAnchorSite(fWidgList.widget[i]).WindowState = wsMinimized then
      DockMaster.GetAnchorSite(fWidgList.widget[i]).Close
    else if not DockMaster.GetAnchorSite(fWidgList.widget[i]).HasParent then
      DockMaster.GetAnchorSite(fWidgList.widget[i]).Close;
  end;
  //
  forceDirectory(getCoeditDocPath);
  xcfg := TXMLConfigStorage.Create(getCoeditDocPath + 'docking.xml.tmp', false);
  try
    DockMaster.SaveLayoutToConfig(xcfg);
    xcfg.WriteToDisk;
    // TODO: remove this when AnchorDocking wont save anymore invalid layout
    with TMemoryStream.Create do try
      LoadFromFile(getCoeditDocPath + 'docking.xml.tmp');
      if Size < 10000 then
      begin
        SaveToFile(getCoeditDocPath + 'docking.xml');
        SysUtils.DeleteFile(getCoeditDocPath + 'docking.xml.tmp');
      end;
    finally
      free;
    end;
  finally
    xcfg.Free;
  end;
  //
  xcfg := TXMLConfigStorage.Create(getCoeditDocPath + 'dockingopts.xml',false);
  try
    DockMaster.SaveSettingsToConfig(xcfg);
    xcfg.WriteToDisk;
  finally
    xcfg.Free;
  end;
end;

procedure TCEMainForm.LoadDocking;
var
  xcfg: TXMLConfigStorage;
  str: TMemoryStream;
begin
  if fileExists(getCoeditDocPath + 'docking.xml') then
  begin
    xcfg := TXMLConfigStorage.Create(getCoeditDocPath + 'docking.xml', true);
    try
      try
        DockMaster.LoadLayoutFromConfig(xcfg, false);
      except
        exit;
      end;
      str := TMemoryStream.Create;
      try
        xcfg.SaveToStream(str);
        str.saveToFile(getCoeditDocPath + 'docking.bak')
      finally
        str.Free;
      end;
    finally
      xcfg.Free;
    end;
  end;
  if fileExists(getCoeditDocPath + 'dockingopts.xml') then
  begin
    xcfg := TXMLConfigStorage.Create(getCoeditDocPath + 'dockingopts.xml', true);
    try
      try
        DockMaster.LoadSettingsFromConfig(xcfg);
      except
        exit;
      end;
      str := TMemoryStream.Create;
      try
        xcfg.SaveToStream(str);
        str.saveToFile(getCoeditDocPath + 'dockingopts.bak')
      finally
        str.Free;
      end;
    finally
      xcfg.Free;
    end;
  end;
end;

procedure TCEMainForm.FreeRunnableProc;
var
  fname: string;
begin
  if fRunProc = nil then
    exit;
  //
  fname := fRunProc.Executable;
  if getprocInputHandler.process = fRunProc  then
  begin
    getMessageDisplay.message('the execution of a runnable module ' +
      'has been implicitly aborted', fDoc, amcEdit, amkWarn);
    getprocInputHandler.addProcess(nil);
  end;
  killProcess(fRunProc);
  if fileExists(fname) then
    if ExtractFilePath(fname) = GetTempDir(false) then
      sysutils.DeleteFile(fname);
end;

procedure TCEMainForm.SaveLastDocsAndProj;
begin
  with TCELastDocsAndProjs.create(nil) do
  try
    assign(self);
    saveToFile(getCoeditDocPath + 'lastdocsandproj.txt');
  finally
    free;
  end;
end;

procedure TCEMainForm.LoadLastDocsAndProj;
begin
  with TCELastDocsAndProjs.create(nil) do
  try
    loadFromFile(getCoeditDocPath + 'lastdocsandproj.txt');
    assignTo(self);
  finally
    free;
  end;
end;

procedure TCEMainForm.DoShow;
begin
  inherited;
  // TODO-cbetterfix: clipboard doesn't work first time it's used on a reloaded doc.
  // see: http://forum.lazarus.freepascal.org/index.php/topic,30616.0.htm
  if (not fFirstShown) then
  begin
    if fAppliOpts.reloadLastDocuments then
      LoadLastDocsAndProj;
    fFirstShown := true;
  end;
end;

destructor TCEMainForm.destroy;
begin
  SaveSettings;
  //
  fWidgList.Free;
  fProjMru.Free;
  fFileMru.Free;
  FreeRunnableProc;
  //
  fMainMenuSubj.Free;
  fActionHandler.Free;
  EntitiesConnector.removeObserver(self);
  inherited;
end;

procedure TCEMainForm.UpdateDockCaption(Exclude: TControl = nil);
begin
  // otherwise dockmaster puts the widget list.
  Caption := 'Coedit';
end;

procedure TCEMainForm.ApplicationProperties1Exception(Sender: TObject;E: Exception);
begin
  if fMesgWidg = nil then
    dlgOkError(E.Message)
  else
    fMsgs.message(E.Message, nil, amcApp, amkErr);
end;

procedure TCEMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  i: Integer;
begin
  canClose := false;
  SaveLastDocsAndProj;
  if (fProjectInterface <> nil) and fProjectInterface.modified and
    (dlgFileChangeClose(fProjectInterface.filename) = mrCancel) then exit;
  for i := fMultidoc.documentCount-1 downto 0 do
    if not fMultidoc.closeDocument(i) then exit;
  canClose := true;
  closeProj;
  // saving doesnt work when csDestroying in comp.state (in Free)
  SaveDocking;
end;

procedure TCEMainForm.updateDocumentBasedAction(sender: TObject);
begin
  TAction(sender).Enabled := fDoc <> nil;
end;

procedure TCEMainForm.updateProjectBasedAction(sender: TObject);
begin
  TAction(sender).Enabled := fProjectInterface <> nil;
end;

procedure TCEMainForm.updateDocEditBasedAction(sender: TObject);
begin
  if (fDoc <> nil) and fDoc.Focused then
    TAction(sender).Enabled := true
  else
    TAction(sender).Enabled := false;
end;

procedure TCEMainForm.ActionsUpdate(AAction: TBasicAction; var Handled: Boolean);
begin
  Handled := false;
  if fUpdateCount > 0 then exit;
  Inc(fUpdateCount);
  try
    clearActProviderEntries;
    collectedActProviderEntries;
    if (AAction <> nil ) then
      if not AAction.Update then
        TAction(AAction).enabled := true;
    updateMainMenuProviders;
  finally
    Dec(fUpdateCount);
  end;
end;

procedure TCEMainForm.updateMainMenuProviders;
var
  i, j: Integer;
  itm: TMenuItem;
  doneUpdate: boolean = false;
begin
  for j := 0 to fMainMenuSubj.observersCount-1 do
  begin
    // try to update existing entry.
    for i := 0 to mainMenu.Items.Count-1 do
      if PtrInt(fMainMenuSubj.observers[j]) = mainMenu.Items[i].Tag then
      begin
        (fMainMenuSubj.observers[j] as ICEMainMenuProvider).menuUpdate(mainMenu.Items[i]);
        doneUpdate := true;
        break;
      end;
    if doneUpdate then
      continue;
    // otherwise propose to create a new entry
    itm := TMenuItem.Create(Self);
    (fMainMenuSubj.observers[j] as ICEMainMenuProvider).menuDeclare(itm);
    itm.Tag:= PtrInt(fMainMenuSubj.observers[j]);
    case itm.Count > 0 of
      true: mainMenu.Items.Add(itm);
      false: itm.Free;
    end;
  end;
end;

procedure TCEMainForm.mruChange(Sender: TObject);
var
  srcLst: TCEMruFileList;
  trgMnu: TMenuItem;
  itm: TMenuItem;
  fname: string;
  clickTrg: TNotifyEvent;
  i: NativeInt;
begin
  srcLst := TCEMruFileList(Sender);
  if srcLst = nil then exit;
  trgMnu := TMenuItem(srcLst.objectTag);
  if trgMnu = nil then exit;

  if fUpdateCount > 0 then exit;
  Inc(fUpdateCount);
  try
    if srcLst = fFileMru then
      clickTrg := @mruFileItemClick
    else if srcLst = fProjMru then
      clickTrg := @mruProjItemClick;

    trgMnu.Clear;

    for i:= 0 to srcLst.Count-1 do
    begin
      fname := srcLst.Strings[i];
      itm := TMenuItem.Create(trgMnu);
      itm.Hint := fname;
      itm.Caption := shortenPath(fname, 50);
      itm.OnClick := clickTrg;
      trgMnu.Add(itm);
    end;

    trgMnu.AddSeparator;
    itm := TMenuItem.Create(trgMnu);
    itm.Caption := 'Clear';
    itm.OnClick := @mruClearClick;
    itm.Tag := PtrInt(srcLst);
    trgMnu.Add(itm);

  finally
    Dec(fUpdateCount);
  end;
end;

procedure TCEMainForm.mruClearClick(Sender: TObject);
var
  srcLst: TCEMruFileList;
begin
  srcLst := TCEMruFileList(TmenuItem(Sender).Tag);
  if srcLst = nil then exit;
  //
  srcLst.Clear;
end;
{$ENDREGION}

{$REGION ICEMultiDocMonitor ----------------------------------------------------}
procedure TCEMainForm.docNew(aDoc: TCESynMemo);
begin
  fDoc := aDoc;
end;

procedure TCEMainForm.docClosing(aDoc: TCESynMemo);
begin
  if aDoc <> fDoc then exit;
  fDoc := nil;
end;

procedure TCEMainForm.docFocused(aDoc: TCESynMemo);
begin
  fDoc := aDoc;
end;

procedure TCEMainForm.docChanged(aDoc: TCESynMemo);
begin
  fDoc := aDoc;
end;
{$ENDREGION}

{$REGION ICEProjectObserver ----------------------------------------------------}
procedure TCEMainForm.projNew(aProject: ICECommonProject);
begin
 fProjectInterface := aProject;
 case fProjectInterface.getFormat of
   pfNative: fNativeProject := TCENativeProject(fProjectInterface.getProject);
   pfDub: fDubProject := TCEDubProject(fProjectInterface.getProject);
 end;
end;

procedure TCEMainForm.projChanged(aProject: ICECommonProject);
begin
end;

procedure TCEMainForm.projClosing(aProject: ICECommonProject);
begin
  if fProjectInterface <> aProject then
    exit;
  fProjectInterface := nil;
  fDubProject := nil;
  fNativeProject := nil;
end;

procedure TCEMainForm.projFocused(aProject: ICECommonProject);
begin
 fProjectInterface := aProject;
 case fProjectInterface.getFormat of
   pfNative: fNativeProject := TCENativeProject(fProjectInterface.getProject);
   pfDub: fDubProject := TCEDubProject(fProjectInterface.getProject);
 end;
end;

procedure TCEMainForm.projCompiling(aProject: ICECommonProject);
begin
end;
{$ENDREGION}

{$REGION ICEEditableShortCut ---------------------------------------------------}
function TCEMainForm.scedWantFirst: boolean;
begin
  fScCollectCount := 0;
  result := true;
end;

function TCEMainForm.scedWantNext(out category, identifier: string; out aShortcut: TShortcut): boolean;
var
  act: TCustomAction;
begin
  act := TCustomAction(Actions.Actions[fScCollectCount]);
  category := act.Category;
  identifier := act.Caption;
  aShortcut := act.ShortCut;
  //
  fScCollectCount += 1;
  result := fScCollectCount < actions.ActionCount;
end;

procedure TCEMainForm.scedSendItem(const category, identifier: string; aShortcut: TShortcut);
var
  act: TCustomAction;
  i: integer;
begin
  for i:= 0 to Actions.ActionCount-1 do
  begin
    act := TCustomAction(Actions.Actions[i]);
    if act.Category <> category then
      continue;
    if act.Caption <> identifier then
      continue;
    act.ShortCut := aShortcut;
  end;
end;
{$ENDREGION}

{$REGION TCEActionProviderHandler ----------------------------------------------}
procedure TCEMainForm.clearActProviderEntries;
var
  prov: ICEActionProvider;
  act: TContainedAction;
  i, j: Integer;
begin
  for i:= 0 to fActionHandler.observersCount-1 do
  begin
    prov := fActionHandler[i] as ICEActionProvider;
    if not prov.actHandlerWantRecollect then
      continue;
    //
    for j := Actions.ActionCount-1 downto 0 do
    begin
      act := Actions.Actions[j];
      if act.Owner = Self then
        continue;
      if act.Tag <> PtrInt(prov) then
        continue;
      //
      act.ActionList := nil;
    end;
  end;
end;

procedure TCEMainForm.collectedActProviderEntries;
var
  prov: ICEActionProvider;
  act: TCustomAction;
  cat: string;
  i: Integer;
  procedure addAction;
  begin
    act.ActionList := Actions;
    act.Tag := ptrInt(prov);
    act.Category := cat;
    //
    act := nil;
    cat := '';
  end;
begin
  for i:= 0 to fActionHandler.observersCount-1 do
  begin
    prov := fActionHandler[i] as ICEActionProvider;
    if not prov.actHandlerWantFirst then
      continue;
    //
    act := nil;
    cat := '';
    while prov.actHandlerWantNext(cat, act) do
      addAction;
    addAction;
  end;
end;
{$ENDREGION}

{$REGION file ------------------------------------------------------------------}
procedure TCEMainForm.actFileHtmlExportExecute(Sender: TObject);
var
  exp: TSynExporterHTML;
begin
  if fDoc = nil then
    exit;
  exp := TSynExporterHTML.Create(nil);
  try
    with TOpenDialog.Create(nil) do
    try
      if Execute then begin
        exp.Highlighter := fDoc.Highlighter;
        exp.Title := fDoc.fileName;
        exp.ExportAsText:=true;
        exp.ExportAll(fDoc.Lines);
        exp.SaveToFile(filename);
      end;
    finally
      Free;
    end;
  finally
    exp.Free;
  end;
end;

procedure TCEMainForm.newFile;
begin
  TCESynMemo.Create(nil);
end;

procedure TCEMainForm.openFile(const aFilename: string);
begin
  fMultidoc.openDocument(aFilename);
end;

procedure TCEMainForm.saveFile(aDocument: TCESynMemo);
begin
  if aDocument.Highlighter = LfmSyn then
    saveProjSource(aDocument)
  else if fileExists(aDocument.fileName) then
    aDocument.save;
end;

procedure TCEMainForm.mruFileItemClick(Sender: TObject);
begin
  openFile(TMenuItem(Sender).Hint);
end;

procedure TCEMainForm.actFileOpenExecute(Sender: TObject);
begin
  if fEditWidg = nil then exit;
  //
  with TOpenDialog.Create(nil) do
  try
    filter := DdiagFilter;
    if execute then
      openFile(filename);
  finally
    free;
  end;
end;

procedure TCEMainForm.actProjOpenContFoldExecute(Sender: TObject);
begin
  if fProjectInterface = nil then exit;
  if not fileExists(fProjectInterface.filename) then exit;
  //
  DockMaster.GetAnchorSite(fExplWidg).Show;
  fExplWidg.expandPath(extractFilePath(fProjectInterface.filename));
end;

procedure TCEMainForm.actFileNewExecute(Sender: TObject);
begin
  newFile;
  fDoc.setFocus;
end;

procedure TCEMainForm.actFileNewRunExecute(Sender: TObject);
begin
  newFile;
  fDoc.Text :=
  'module runnable;' + LineEnding +
  LineEnding +
  'import std.stdio;' + LineEnding +
  LineEnding +
  'void main(string[] args)' + LineEnding +
  '{' + LineEnding +
  '    // this file can be directly executed using menu file/compile & run' + LineEnding +
  '    // phobos and libman imports are allowed' + LineEnding +
  '    writeln("hello runnable module");' + LineEnding +
  '}';
  fDoc.setFocus;
end;

procedure TCEMainForm.actFileSaveAsExecute(Sender: TObject);
begin
  if fDoc = nil then exit;
  //
  with TSaveDialog.Create(nil) do
  try
    Filter := DdiagFilter;
    if execute then
      fDoc.saveToFile(filename);
  finally
    free;
  end;
end;

procedure TCEMainForm.actFileSaveExecute(Sender: TObject);
var
  str: string;
begin
  if fDoc = nil then exit;
  //
  str := fDoc.fileName;
  if (str <> fDoc.tempFilename) and (fileExists(str)) then
    saveFile(fDoc)
  else
    actFileSaveAs.Execute;
end;

procedure TCEMainForm.actFileAddToProjExecute(Sender: TObject);
begin
  if fDoc = nil then exit;
  if fDoc.isProjectFile then exit;
  if fProjectInterface = nil then exit;
  //
  if fProjectInterface.getFormat = pfNative then
  begin
    if fileExists(fDoc.fileName) and (not fDoc.isTemporary) then
      fNativeProject.addSource(fDoc.fileName)
    else dlgOkInfo('the file has not been added to the project because it does not exist');
  end else
    getMessageDisplay.message('use the DUB project editor to add a source to a DUB project',
      nil, amcApp, amkHint);
end;

procedure TCEMainForm.actFileCloseExecute(Sender: TObject);
begin
  if fDoc = nil then exit;
  if (fDoc.modified or(fDoc.fileName = fDoc.tempFilename))
      and (dlgFileChangeClose(fDoc.fileName) = mrCancel) then exit;
  fDoc.Free;
end;

procedure TCEMainForm.actFileSaveAllExecute(Sender: TObject);
var
  i: Integer;
begin
  for i:= 0 to fMultidoc.documentCount-1 do
    saveFile(fMultidoc.document[i]);
end;

procedure TCEMainForm.FormDropFiles(Sender: TObject;const FileNames: array of string);
var
  fname: string;
begin
  for fname in FileNames do
  begin
    if isEditable(fname) then
      openFile(fname)
    else if isValidNativeProject(fname) or isValidDubProject(fname) then
    begin
      openProj(fname);
      break;
    end
    else openFile(fname);
  end;
end;
{$ENDREGION}

{$REGION edit ------------------------------------------------------------------}
procedure TCEMainForm.actEdCopyExecute(Sender: TObject);
begin
  if assigned(fDoc) then
    fDoc.CopyToClipboard;
end;

procedure TCEMainForm.actEdCutExecute(Sender: TObject);
begin
  if assigned(fDoc) then
    fDoc.CutToClipboard;
end;

procedure TCEMainForm.actEdPasteExecute(Sender: TObject);
begin
  if assigned(fDoc) then
    fDoc.PasteFromClipboard;
end;

procedure TCEMainForm.actEdUndoExecute(Sender: TObject);
begin
  if assigned(fDoc) then
    fDoc.Undo;
end;

procedure TCEMainForm.actEdRedoExecute(Sender: TObject);
begin
  if assigned(fDoc) then
    fDoc.Redo;
end;

procedure TCEMainForm.actEdMacPlayExecute(Sender: TObject);
begin
  if assigned(fDoc) then
    fEditWidg.macRecorder.PlaybackMacro(fDoc);
end;

procedure TCEMainForm.actEdMacStartStopExecute(Sender: TObject);
begin
  if assigned(fDoc) then
  begin
    if fEditWidg.macRecorder.State = msRecording then
      fEditWidg.macRecorder.Stop
    else fEditWidg.macRecorder.RecordMacro(fDoc);
  end;
end;

procedure TCEMainForm.actEdIndentExecute(Sender: TObject);
begin
  if assigned(fDoc) then
    fDoc.ExecuteCommand(ecBlockIndent, '', nil);
end;

procedure TCEMainForm.actEdUnIndentExecute(Sender: TObject);
begin
  if assigned(fDoc) then
    fDoc.ExecuteCommand(ecBlockUnIndent, '', nil);
end;

procedure TCEMainForm.actEdFindExecute(Sender: TObject);
var
  win: TAnchorDockHostSite;
  str: string;
begin
  win := DockMaster.GetAnchorSite(fFindWidg);
  if win = nil then exit;
  win.Show;
  win.BringToFront;
  if fDoc = nil then exit;
  //
  if fDoc.SelAvail then
    str := fDoc.SelText
  else
    str := fDoc.Identifier;
  ffindwidg.cbToFind.Text := str;
  ffindwidg.cbToFindChange(nil);
end;

procedure TCEMainForm.actEdFindNextExecute(Sender: TObject);
begin
  ffindwidg.actFindNextExecute(nil);
end;
{$ENDREGION}

{$REGION run -------------------------------------------------------------------}
procedure TCEMainForm.asyncprocOutput(sender: TObject);
var
  proc: TCEProcess;
  lst: TStringList;
  str: string;
begin
  proc := TCEProcess(sender);
  lst := TStringList.Create;
  try
    proc.getFullLines(lst);
    //processOutputToStrings(proc, lst);
    if proc = fRunProc then for str in lst do
      fMsgs.message(str, fDoc, amcEdit, amkBub)
    else if proc.Executable = DCompiler then
      for str in lst do
        fMsgs.message(str, fDoc, amcEdit, amkAuto);
  finally
    lst.Free;
  end;
end;

procedure TCEMainForm.asyncprocTerminate(sender: TObject);
var
  proc: TCEProcess;
  inph: TObject;
begin
  proc := TCEProcess(sender);
  asyncprocOutput(sender);
  inph := EntitiesConnector.getSingleService('ICEProcInputHandler');
  if (inph <> nil) then
    (inph as ICEProcInputHandler).removeProcess(proc);
  if (proc.ExitStatus <> 0) then
    fMsgs.message(format('error: the process (%s) has returned the signal %d',
      [proc.Executable, proc.ExitStatus]), fDoc, amcEdit, amkErr);
end;

procedure TCEMainForm.actSetRunnableSwExecute(Sender: TObject);
var
  form: TForm;
  memo: TMemo;
  i, j: integer;
  cur: string;
begin
  if fRunnableSw = '' then
    fRunnableSw := '-vcolumns'#13'-w'#13'-wi';
  form := TForm.Create(nil);
  form.BorderIcons:= [biSystemMenu];
  memo := TMemo.Create(form);
  memo.Align := alClient;
  memo.BorderSpacing.Around:=4;
  memo.Text := fRunnableSw;
  memo.Parent := form;
  form.ShowModal;
  //
  fRunnableSw := '';
  for i := memo.Lines.Count-1 downto 0 do
  begin
    cur := memo.Lines.Strings[i];
    // duplicated item
    j := memo.Lines.IndexOf(cur);
    if (j > -1) and (j < i) then
      continue;
    // not a switch
    if length(cur) < 2 then
      continue;
    if cur[1] <> '-' then
      continue;
    // added dynamically when needed
    if cur = '-unittest' then
      continue;
    if cur = '-main' then
      continue;
    RemoveTrailingChars(cur, [#0..#30]);
    fRunnableSw += (cur + #13);
  end;
  if (fRunnableSw <> '') and (fRunnableSw[length(fRunnableSw)] = #13) then
    fRunnableSw := fRunnableSw[1..length(fRunnableSw)-1];
  if fRunnableSw = '' then
    fRunnableSw := '-vcolumns'#13'-w'#13'-wi';
  //
  form.Free;
end;

procedure TCEMainForm.compileAndRunFile(unittest: boolean = false; redirect: boolean = true;
	const runArgs: string = '');
var
  i: integer;
  dmdproc: TCEProcess;
  extraArgs: TStringList;
  fname, firstlineFlags: string;
begin

  fMsgs.clearByData(fDoc);
  FreeRunnableProc;
  if fDoc = nil then exit;
  if fDoc.Lines.Count = 0 then exit;

  firstlineFlags := fDoc.Lines[0];
  i := length(firstlineFlags);
  if ( i > 18) then
  begin
    if UpperCase(firstlineFlags[1..17]) = '#!RUNNABLE-FLAGS:' then
        firstlineFlags := symbolExpander.get(firstlineFlags[18..i])
    else firstlineFlags:= '';
  end else firstlineFlags:= '';


  fRunProc := TCEProcess.Create(nil);
  if redirect then
  begin
  	fRunProc.Options := [poStderrToOutPut, poUsePipes];
  	fRunProc.ShowWindow := swoHIDE;
  	fRunProc.OnReadData := @asyncprocOutput;
  	fRunProc.OnTerminate:= @asyncprocTerminate;
  end else
  begin
    {$IFDEF LINUX}
    fRunProc.Options := fRunProc.Options + [poNewConsole];
    {$ENDIF}
  end;

  extraArgs := TStringList.Create;
  dmdproc := TCEProcess.Create(nil);
  try

    fMsgs.message('compiling ' + shortenPath(fDoc.fileName, 25), fDoc, amcEdit, amkInf);

    if fileExists(fDoc.fileName) then fDoc.save
    else fDoc.saveTempFile;
    fname := stripFileExt(fDoc.fileName);

    if fRunnableSw = '' then
      fRunnableSw := '-vcolumns'#13'-w'#13'-wi';
    {$IFDEF RELEASE}
    dmdProc.ShowWindow := swoHIDE;
    {$ENDIF}
  	dmdproc.OnReadData := @asyncprocOutput;
  	dmdproc.OnTerminate:= @asyncprocTerminate;
    dmdproc.Options := [poUsePipes, poStderrToOutPut];
    dmdproc.Executable := DCompiler;
    dmdproc.Parameters.Add(fDoc.fileName);
    dmdproc.Parameters.Add('-J' + ExtractFilePath(fDoc.fileName));
    dmdproc.Parameters.AddText(fRunnableSw);
    CommandToList(firstlineFlags, extraArgs);
    dmdproc.Parameters.AddStrings(extraArgs);
    if unittest then
    begin
      dmdproc.Parameters.Add('-main');
      dmdproc.Parameters.Add('-unittest');
    end
    else dmdproc.Parameters.Add('-version=runnable_module');
    dmdproc.Parameters.Add('-of' + fname + exeExt);
    LibMan.getLibFiles(nil, dmdproc.Parameters);
    LibMan.getLibSources(nil, dmdproc.Parameters);
    deleteDups(dmdproc.Parameters);
    dmdproc.Execute;
    while dmdproc.Running do
      application.ProcessMessages;

    if (dmdProc.ExitStatus = 0) then
    begin
      fMsgs.message(shortenPath(fDoc.fileName, 25) + ' successfully compiled',
        fDoc, amcEdit, amkInf);
      fRunProc.CurrentDirectory := extractFileDir(fRunProc.Executable);
      if runArgs <> '' then
      begin
        extraArgs.Clear;
        CommandToList(symbolExpander.get(runArgs), extraArgs);
        fRunProc.Parameters.AddStrings(extraArgs);
      end;
      fRunProc.Executable := fname + exeExt;
      if redirect then
      	getprocInputHandler.addProcess(fRunProc);
      fRunProc.Execute;
      sysutils.DeleteFile(fname + objExt);
    end
    else begin
      fMsgs.message(shortenPath(fDoc.fileName,25) + ' has not been compiled',
        fDoc, amcEdit, amkErr);
    end;

  finally
    dmdproc.Free;
    extraArgs.Free;
  end;
end;

procedure TCEMainForm.actFileUnittestExecute(Sender: TObject);
begin
  if fDoc = nil then exit;
  compileAndRunFile(true);
end;

procedure TCEMainForm.actFileCompAndRunExecute(Sender: TObject);
begin
  if fDoc = nil then exit;
  compileAndRunFile(false);
end;

procedure TCEMainForm.actFileCompileAndRunOutExecute(Sender: TObject);
begin
  if fDoc = nil then exit;
  compileAndRunFile(false, false);
end;

procedure TCEMainForm.actFileCompAndRunWithArgsExecute(Sender: TObject);
var
  runargs: string = '';
begin
  if fDoc = nil then exit;
  if InputQuery('Execution arguments', '', runargs) then
    compileAndRunFile(false, true, runargs);
end;

procedure TCEMainForm.actFileOpenContFoldExecute(Sender: TObject);
begin
  if fDoc = nil then exit;
  if not fileExists(fDoc.fileName) then exit;
  //
  DockMaster.GetAnchorSite(fExplWidg).Show;
  fExplWidg.expandPath(extractFilePath(fDoc.fileName));
end;

procedure TCEMainForm.actProjCompileExecute(Sender: TObject);
begin
  fProjectInterface.compile;
end;

procedure TCEMainForm.actProjCompileAndRunExecute(Sender: TObject);
begin
  if fProjectInterface.compile then
    fProjectInterface.run;
end;

procedure TCEMainForm.actProjCompAndRunWithArgsExecute(Sender: TObject);
var
  runargs: string = '';
begin
  if not fProjectInterface.compile then
    exit;
  if InputQuery('Execution arguments', '', runargs) then
    fProjectInterface.run(runargs);
end;

procedure TCEMainForm.actProjRunExecute(Sender: TObject);
begin
  if fProjectInterface.binaryKind <> executable then
  begin
    dlgOkInfo('Non executable projects cant be run');
    exit;
  end;
  if (not fProjectInterface.targetUpToDate) then if
    dlgOkCancel('The project output is not up-to-date, rebuild ?') = mrOK then
      fProjectInterface.compile;
  if fileExists(fProjectInterface.outputFilename)
      or (fProjectInterface.getFormat = pfDub) then
        fProjectInterface.run;
end;

procedure TCEMainForm.actProjRunWithArgsExecute(Sender: TObject);
var
  runargs: string = '';
begin
  if InputQuery('Execution arguments', '', runargs) then
    fProjectInterface.run(runargs);
end;
{$ENDREGION}

{$REGION view ------------------------------------------------------------------}
procedure TCEMainForm.updateWidgetMenuEntry(sender: TObject);
var
  widg: TCEWidget;
  act: TAction;
begin
  if sender = nil then exit;
  act := TAction(sender);
  if act.Tag = 0 then exit;
  //
  widg := TCEWidget(act.Tag);

  if widg.isDockable then
  begin
    if DockMaster.GetAnchorSite(widg).GetTopParent = DockMaster.GetAnchorSite(widg) then
      act.Enabled := true
    else
      act.Enabled := not widg.Parent.IsVisible
  end
  else act.Enabled := not widg.IsVisible;
end;

procedure TCEMainForm.widgetShowFromAction(sender: TObject);
var
  widg: TCEWidget;
begin
  widg := TCEWidget( TComponent(sender).tag );
  if widg = nil then exit;
  //
  widg.showWidget;
end;

procedure TCEMainForm.layoutLoadFromFile(const aFilename: string);
var
  xcfg: TXMLConfigStorage;
begin
  if not fileExists(aFilename) then
    exit;
  //
  xcfg := TXMLConfigStorage.Create(aFilename, true);
  try
    DockMaster.RestoreLayouts.Clear;
    DockMaster.LoadLayoutFromConfig(xcfg, false);
  finally
    xcfg.Free;
  end;
end;

procedure TCEMainForm.layoutSaveToFile(const aFilename: string);
var
  xcfg: TXMLConfigStorage;
  i: NativeInt;
begin
  DockMaster.RestoreLayouts.Clear;
  for i:= 0 to fWidgList.Count-1 do
  begin
    if not fWidgList.widget[i].isDockable then continue;
    if DockMaster.GetAnchorSite(fWidgList.widget[i]).WindowState = wsMinimized then
      DockMaster.GetAnchorSite(fWidgList.widget[i]).Close
    else if not DockMaster.GetAnchorSite(fWidgList.widget[i]).HasParent then
      DockMaster.GetAnchorSite(fWidgList.widget[i]).Close;
  end;
  //
  forceDirectory(extractFilePath(aFilename));
  xcfg := TXMLConfigStorage.Create(aFilename + '.tmp', false);
  try
    DockMaster.SaveLayoutToConfig(xcfg);
    xcfg.WriteToDisk;
    // prevent any invalid layout to be saved (AnchorDocking bug)
    // TODO: remove this when AnchorDocking wont save anymore invalid layout
    with TMemoryStream.Create do try
      LoadFromFile(aFilename + '.tmp');
      if Size < 10000 then
      begin
        SaveToFile(aFilename);
        SysUtils.DeleteFile(aFilename + '.tmp');
      end else
        getMessageDisplay.message('prevented an invalid layout to be saved', nil,
          amcApp, amkWarn);
    finally
      free;
    end;
  finally
    xcfg.Free;
  end;
end;

procedure TCEMainForm.layoutUpdateMenu;
var
  lst: TStringList;
  itm: TMenuItem;
  i: NativeInt;
begin
  mnuLayout.Clear;
  //
  itm := TMenuItem.Create(self);
  itm.Action := actLayoutSave;
  mnuLayout.Add(itm);
  mnuLayout.AddSeparator;
  //
  lst := TStringList.Create;
  try
    listFiles(lst, getCoeditDocPath + 'layouts' + DirectorySeparator);
    for i := 0 to lst.Count-1 do
    begin
      itm := TMenuItem.Create(self);
      itm.Caption := extractFileName(lst.Strings[i]);
      itm.Caption := stripFileExt(itm.Caption);
      itm.OnClick := @layoutMnuItemClick;
      itm.ImageIndex := 32;
      mnuLayout.Add(itm);
    end;
  finally
    lst.Free;
  end;
end;

procedure TCEMainForm.layoutMnuItemClick(sender: TObject);
begin
  layoutLoadFromFile(getCoeditDocPath + 'layouts' + DirectorySeparator +
    TMenuItem(sender).Caption + '.xml');
end;

procedure TCEMainForm.actLayoutSaveExecute(Sender: TObject);
var
  fname: string = '';
begin
  if not InputQuery('New layout name', '', fname) then
    exit;
  //
  fname := extractFileName(fname);
  if extractFileExt(fname) <> '.xml' then
    fname += '.xml';
  layoutSaveToFile(getCoeditDocPath + 'layouts' + DirectorySeparator + fname);
  layoutUpdateMenu;
end;

procedure TCEMainForm.updateFloatingWidgetOnTop(onTop: boolean);
var
  widg: TCEWidget;
const
  fstyle: array[boolean] of TFormStyle = (fsNormal, fsStayOnTop);
begin
  for widg in fWidgList do if (widg.Parent <> nil) and
    (widg.Parent.Parent = nil) and widg.isDockable then
  begin
    TForm(widg.Parent).FormStyle := fstyle[onTop];
    //TODO-bugfix: floating widg on top from true to false, widg remains on top
    if TForm(widg.Parent).Visible then if not onTop then
      TForm(widg.Parent).SendToBack;
  end;
end;
{$ENDREGION}

{$REGION project ---------------------------------------------------------------}
procedure TCEMainForm.showProjTitle;
begin
  if (fProjectInterface <> nil) and fileExists(fProjectInterface.filename) then
    caption := format('Coedit - %s', [shortenPath(fProjectInterface.filename, 30)])
  else
    caption := 'Coedit';
end;

procedure TCEMainForm.saveProjSource(const aEditor: TCESynMemo);
begin
  if fProjectInterface = nil then exit;
  if fProjectInterface.filename <> aEditor.fileName then exit;
  //
  aEditor.saveToFile(fProjectInterface.filename);
  openProj(fProjectInterface.filename);
end;

procedure TCEMainForm.closeProj;
begin
  if fProjectInterface = nil then exit;
  //
  fProjectInterface.getProject.Free;
  fProjectInterface := nil;
  fNativeProject := nil;
  fDubProject := nil;
  showProjTitle;
end;

procedure TCEMainForm.actProjNewDubJsonExecute(Sender: TObject);
begin
  if (fProjectInterface <> nil) and fProjectInterface.modified and
    (dlgFileChangeClose(fProjectInterface.filename) = mrCancel) then exit;
  closeProj;
  newDubProj;
end;

procedure TCEMainForm.actProjNewNativeExecute(Sender: TObject);
begin
  if (fProjectInterface <> nil) and fProjectInterface.modified and
    (dlgFileChangeClose(fProjectInterface.filename) = mrCancel) then exit;
  closeProj;
  newNativeProj;
end;

procedure TCEMainForm.newNativeProj;
begin
  fNativeProject := TCENativeProject.Create(nil);
  fNativeProject.Name := 'CurrentProject';
  fProjectInterface := fNativeProject as ICECommonProject;
  showProjTitle;
end;

procedure TCEMainForm.newDubProj;
begin
  fDubProject := TCEDubProject.create(nil);
  fDubProject.json.Add('name', '');
  fDubProject.beginModification;
  fDubProject.endModification;
  fProjectInterface := fDubProject as ICECommonProject;
  showProjTitle;
end;

procedure TCEMainForm.saveProj;
begin
  fProjectInterface.saveToFile(fProjectInterface.filename);
end;

procedure TCEMainForm.saveProjAs(const aFilename: string);
begin
  fProjectInterface.saveToFile(aFilename);
  showProjTitle;
end;

procedure TCEMainForm.openProj(const aFilename: string);
begin
  closeProj;
  if LowerCase(ExtractFileExt(aFilename)) = '.json' then
    newDubProj
  else
    newNativeProj;
  //
  fProjectInterface.loadFromFile(aFilename);
  showProjTitle;
end;

procedure TCEMainForm.mruProjItemClick(Sender: TObject);
begin
  if (fProjectInterface <> nil) and fProjectInterface.modified and
    (dlgFileChangeClose(fProjectInterface.filename) = mrCancel) then exit;
  openProj(TMenuItem(Sender).Hint);
end;

procedure TCEMainForm.actProjCloseExecute(Sender: TObject);
begin
  if (fProjectInterface <> nil) and fProjectInterface.modified and
    (dlgFileChangeClose(fProjectInterface.filename) = mrCancel) then exit;
  closeProj;
end;

procedure TCEMainForm.actProjSaveAsExecute(Sender: TObject);
begin
  with TSaveDialog.Create(nil) do
  try
    if execute then saveProjAs(filename);
  finally
    Free;
  end;
end;

procedure TCEMainForm.actProjSaveExecute(Sender: TObject);
begin
  if fProjectInterface = nil then exit;
  if fProjectInterface.filename <> '' then saveProj
  else actProjSaveAs.Execute;
end;

procedure TCEMainForm.actProjOpenExecute(Sender: TObject);
begin
  if (fProjectInterface <> nil) and fProjectInterface.modified and
    (dlgFileChangeClose(fProjectInterface.filename) = mrCancel) then exit;
  with TOpenDialog.Create(nil) do
  try
    if execute then openProj(filename);
  finally
    Free;
  end;
end;

procedure TCEMainForm.actProjOptsExecute(Sender: TObject);
var
  win: TControl = nil;
begin
  if assigned(fProjectInterface) then case fProjectInterface.getFormat of
    pfDub: win := DockMaster.GetAnchorSite(fDubProjWidg);
    pfNative: win := DockMaster.GetAnchorSite(fPrjCfWidg);
  end
  else win := DockMaster.GetAnchorSite(fPrjCfWidg);
  if assigned(win) then
  begin
    win.Show;
    win.BringToFront;
  end;
end;

procedure TCEMainForm.actProjSourceExecute(Sender: TObject);
begin
  if fProjectInterface = nil then exit;
  if not fileExists(fProjectInterface.filename) then exit;
  //
  openFile(fProjectInterface.filename);
  //TODO-cDUB: add json highligher to edit json project in CE
  fDoc.Highlighter := LfmSyn;
end;

procedure TCEMainForm.actProjOptViewExecute(Sender: TObject);
begin
  if fProjectInterface = nil then exit;
  dlgOkInfo(fProjectInterface.getCommandLine);
end;
{$ENDREGION}

initialization
  registerClasses([TCEPersistentMainShortcuts, TCEPersistentMainMrus,
    TCELastDocsAndProjs]);
end.
