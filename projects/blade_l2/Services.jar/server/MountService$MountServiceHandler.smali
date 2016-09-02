.class Lcom/android/server/MountService$MountServiceHandler;
.super Landroid/os/Handler;
.source "MountService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/MountService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MountServiceHandler"
.end annotation


# instance fields
.field mForceUnmounts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/MountService$UnmountCallBack;",
            ">;"
        }
    .end annotation
.end field

.field mUpdatingStatus:Z

.field final synthetic this$0:Lcom/android/server/MountService;


# direct methods
.method constructor <init>(Lcom/android/server/MountService;Landroid/os/Looper;)V
    .locals 1
    .param p2, "l"    # Landroid/os/Looper;

    .prologue
    .line 576
    iput-object p1, p0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    .line 577
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 573
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    .line 574
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    .line 578
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 28
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 582
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v23, v0

    packed-switch v23, :pswitch_data_0

    .line 783
    :cond_0
    :goto_0
    return-void

    .line 584
    :pswitch_0
    const-string v23, "MountService"

    const-string v24, "H_UNMOUNT_PM_UPDATE"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 585
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v21, v0

    check-cast v21, Lcom/android/server/MountService$UnmountCallBack;

    .line 586
    .local v21, "ucb":Lcom/android/server/MountService$UnmountCallBack;
    const/16 v22, 0x0

    .line 587
    .local v22, "volume":Landroid/os/storage/StorageVolume;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mVolumesLock:Ljava/lang/Object;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$700(Lcom/android/server/MountService;)Ljava/lang/Object;

    move-result-object v24

    monitor-enter v24

    .line 588
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mVolumesByPath:Ljava/util/HashMap;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$800(Lcom/android/server/MountService;)Ljava/util/HashMap;

    move-result-object v23

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/server/MountService$UnmountCallBack;->path:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    move-object/from16 v0, v23

    check-cast v0, Landroid/os/storage/StorageVolume;

    move-object/from16 v22, v0

    .line 589
    monitor-exit v24
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 590
    if-nez v22, :cond_1

    .line 591
    const-string v23, "MountService"

    const-string v24, "H_UNMOUNT_PM_UPDATE volume is not exist!"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 589
    :catchall_0
    move-exception v23

    :try_start_1
    monitor-exit v24
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v23

    .line 609
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    const-string v24, "android.intent.action.MEDIA_EJECT"

    sget-object v25, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v22

    move-object/from16 v3, v25

    # invokes: Lcom/android/server/MountService;->sendStorageIntent(Ljava/lang/String;Landroid/os/storage/StorageVolume;Landroid/os/UserHandle;)V
    invoke-static {v0, v1, v2, v3}, Lcom/android/server/MountService;->access$1000(Lcom/android/server/MountService;Ljava/lang/String;Landroid/os/storage/StorageVolume;Landroid/os/UserHandle;)V

    .line 610
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mUnmountSwap:Z
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$200(Lcom/android/server/MountService;)Z

    move-result v23

    if-eqz v23, :cond_2

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/server/MountService$UnmountCallBack;->path:Ljava/lang/String;

    move-object/from16 v23, v0

    const-string v24, "/storage/sdcard1"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_2

    .line 611
    const/16 v20, 0x0

    .line 612
    .local v20, "swapVolume":Landroid/os/storage/StorageVolume;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mVolumesLock:Ljava/lang/Object;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$700(Lcom/android/server/MountService;)Ljava/lang/Object;

    move-result-object v24

    monitor-enter v24

    .line 613
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mVolumesByPath:Ljava/util/HashMap;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$800(Lcom/android/server/MountService;)Ljava/util/HashMap;

    move-result-object v23

    const-string v25, "/storage/sdcard1"

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    move-object/from16 v0, v23

    check-cast v0, Landroid/os/storage/StorageVolume;

    move-object/from16 v20, v0

    .line 614
    monitor-exit v24
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 615
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    const-string v24, "android.intent.action.MEDIA_EJECT"

    sget-object v25, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v20

    move-object/from16 v3, v25

    # invokes: Lcom/android/server/MountService;->sendStorageIntent(Ljava/lang/String;Landroid/os/storage/StorageVolume;Landroid/os/UserHandle;)V
    invoke-static {v0, v1, v2, v3}, Lcom/android/server/MountService;->access$1000(Lcom/android/server/MountService;Ljava/lang/String;Landroid/os/storage/StorageVolume;Landroid/os/UserHandle;)V

    .line 617
    .end local v20    # "swapVolume":Landroid/os/storage/StorageVolume;
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mShutdownCount:I
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$1700(Lcom/android/server/MountService;)I

    move-result v23

    if-lez v23, :cond_3

    .line 618
    const-wide/16 v23, 0x1f4

    invoke-static/range {v23 .. v24}, Landroid/os/SystemClock;->sleep(J)V

    .line 623
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 624
    const-string v23, "MountService"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, " registered = "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    move/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 626
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    move/from16 v23, v0

    if-nez v23, :cond_0

    .line 627
    const-string v23, "MountService"

    const-string v24, "Updating external media status on PackageManager"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 628
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/server/MountService$UnmountCallBack;->path:Ljava/lang/String;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->EXTERNAL_SD1:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/MountService;->access$1900()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_4

    .line 629
    const/16 v23, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    .line 630
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mPms:Lcom/android/server/pm/PackageManagerService;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$2000(Lcom/android/server/MountService;)Lcom/android/server/pm/PackageManagerService;

    move-result-object v23

    const/16 v24, 0x0

    const/16 v25, 0x1

    invoke-virtual/range {v23 .. v25}, Lcom/android/server/pm/PackageManagerService;->updateExternalMediaStatus(ZZ)V

    goto/16 :goto_0

    .line 614
    .restart local v20    # "swapVolume":Landroid/os/storage/StorageVolume;
    :catchall_1
    move-exception v23

    :try_start_3
    monitor-exit v24
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v23

    .line 620
    .end local v20    # "swapVolume":Landroid/os/storage/StorageVolume;
    :cond_3
    const-wide/16 v23, 0x5dc

    invoke-static/range {v23 .. v24}, Landroid/os/SystemClock;->sleep(J)V

    goto :goto_1

    .line 631
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mUnmountPrimary:Z
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$1500(Lcom/android/server/MountService;)Z

    move-result v23

    if-nez v23, :cond_0

    .line 634
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/android/server/MountService;->finishMediaUpdate()V

    goto/16 :goto_0

    .line 640
    .end local v21    # "ucb":Lcom/android/server/MountService$UnmountCallBack;
    .end local v22    # "volume":Landroid/os/storage/StorageVolume;
    :pswitch_1
    const-string v23, "MountService"

    const-string v24, "H_UNMOUNT_PM_DONE"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 641
    const-string v23, "MountService"

    const-string v24, "Updated status. Processing requests"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    const/16 v23, 0x0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/server/MountService$MountServiceHandler;->mUpdatingStatus:Z

    .line 643
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v16

    .line 644
    .local v16, "size":I
    move/from16 v0, v16

    new-array v0, v0, [I

    move-object/from16 v17, v0

    .line 645
    .local v17, "sizeArr":[I
    const/16 v18, 0x0

    .line 647
    .local v18, "sizeArrN":I
    const-string v23, "activity"

    invoke-static/range {v23 .. v23}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v4

    check-cast v4, Lcom/android/server/am/ActivityManagerService;

    .line 649
    .local v4, "ams":Lcom/android/server/am/ActivityManagerService;
    const/4 v7, 0x0

    .local v7, "i":I
    move/from16 v19, v18

    .end local v18    # "sizeArrN":I
    .local v19, "sizeArrN":I
    :goto_2
    move/from16 v0, v16

    if-ge v7, v0, :cond_14

    .line 650
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/android/server/MountService$UnmountCallBack;

    .line 652
    .restart local v21    # "ucb":Lcom/android/server/MountService$UnmountCallBack;
    const/16 v22, 0x0

    .line 653
    .restart local v22    # "volume":Landroid/os/storage/StorageVolume;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mVolumesLock:Ljava/lang/Object;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$700(Lcom/android/server/MountService;)Ljava/lang/Object;

    move-result-object v24

    monitor-enter v24

    .line 654
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mVolumesByPath:Ljava/util/HashMap;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$800(Lcom/android/server/MountService;)Ljava/util/HashMap;

    move-result-object v23

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/server/MountService$UnmountCallBack;->path:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    move-object/from16 v0, v23

    check-cast v0, Landroid/os/storage/StorageVolume;

    move-object/from16 v22, v0

    .line 655
    monitor-exit v24
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 656
    if-nez v22, :cond_5

    .line 657
    const-string v23, "MountService"

    const-string v24, "H_UNMOUNT_PM_DONE volume is not exist!"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 658
    add-int/lit8 v18, v19, 0x1

    .end local v19    # "sizeArrN":I
    .restart local v18    # "sizeArrN":I
    aput v7, v17, v19

    .line 649
    :goto_3
    add-int/lit8 v7, v7, 0x1

    move/from16 v19, v18

    .end local v18    # "sizeArrN":I
    .restart local v19    # "sizeArrN":I
    goto :goto_2

    .line 655
    :catchall_2
    move-exception v23

    :try_start_5
    monitor-exit v24
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v23

    .line 676
    :cond_5
    move-object/from16 v0, v21

    iget-object v13, v0, Lcom/android/server/MountService$UnmountCallBack;->path:Ljava/lang/String;

    .line 677
    .local v13, "path":Ljava/lang/String;
    const/4 v11, 0x0

    .line 678
    .local v11, "needKill":Z
    const/4 v5, 0x0

    .line 679
    .local v5, "done":Z
    move-object/from16 v0, v21

    iget-boolean v0, v0, Lcom/android/server/MountService$UnmountCallBack;->force:Z

    move/from16 v23, v0

    if-nez v23, :cond_7

    .line 680
    const/4 v5, 0x1

    .line 722
    :cond_6
    :goto_4
    if-nez v5, :cond_12

    move-object/from16 v0, v21

    iget v0, v0, Lcom/android/server/MountService$UnmountCallBack;->retries:I

    move/from16 v23, v0

    const/16 v24, 0x4

    move/from16 v0, v23

    move/from16 v1, v24

    if-ge v0, v1, :cond_12

    .line 724
    const-string v23, "MountService"

    const-string v24, "Retrying to kill storage users again"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 725
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mHandler:Landroid/os/Handler;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$2100(Lcom/android/server/MountService;)Landroid/os/Handler;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v24, v0

    # getter for: Lcom/android/server/MountService;->mHandler:Landroid/os/Handler;
    invoke-static/range {v24 .. v24}, Lcom/android/server/MountService;->access$2100(Lcom/android/server/MountService;)Landroid/os/Handler;

    move-result-object v24

    const/16 v25, 0x2

    move-object/from16 v0, v21

    iget v0, v0, Lcom/android/server/MountService$UnmountCallBack;->retries:I

    move/from16 v26, v0

    add-int/lit8 v27, v26, 0x1

    move/from16 v0, v27

    move-object/from16 v1, v21

    iput v0, v1, Lcom/android/server/MountService$UnmountCallBack;->retries:I

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v24 .. v26}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v24

    const-wide/16 v25, 0x1e

    invoke-virtual/range {v23 .. v26}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    move/from16 v18, v19

    .end local v19    # "sizeArrN":I
    .restart local v18    # "sizeArrN":I
    goto :goto_3

    .line 682
    .end local v18    # "sizeArrN":I
    .restart local v19    # "sizeArrN":I
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v13}, Lcom/android/server/MountService;->getStorageUsers(Ljava/lang/String;)[I

    move-result-object v14

    .line 683
    .local v14, "pids":[I
    if-eqz v14, :cond_8

    array-length v0, v14

    move/from16 v23, v0

    if-nez v23, :cond_9

    .line 684
    :cond_8
    const/4 v5, 0x1

    goto :goto_4

    .line 685
    :cond_9
    if-eqz v4, :cond_11

    .line 686
    invoke-virtual {v4}, Lcom/android/server/am/ActivityManagerService;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v15

    .line 687
    .local v15, "runningList":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    if-eqz v15, :cond_f

    .line 688
    array-length v10, v14

    .line 689
    .local v10, "len":I
    const/4 v9, 0x0

    .local v9, "k":I
    :goto_5
    if-ge v9, v10, :cond_a

    .line 690
    if-eqz v11, :cond_c

    .line 706
    .end local v9    # "k":I
    .end local v10    # "len":I
    :cond_a
    :goto_6
    if-eqz v11, :cond_10

    .line 708
    const-string v23, "unmount media"

    const/16 v24, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v24

    invoke-virtual {v4, v14, v0, v1}, Lcom/android/server/am/ActivityManagerService;->killPids([ILjava/lang/String;Z)Z

    .line 710
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v13}, Lcom/android/server/MountService;->getStorageUsers(Ljava/lang/String;)[I

    move-result-object v14

    .line 711
    if-eqz v14, :cond_b

    array-length v0, v14

    move/from16 v23, v0

    if-nez v23, :cond_6

    .line 712
    :cond_b
    const/4 v5, 0x1

    goto/16 :goto_4

    .line 693
    .restart local v9    # "k":I
    .restart local v10    # "len":I
    :cond_c
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_e

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 694
    .local v12, "p":Landroid/app/ActivityManager$RunningAppProcessInfo;
    iget v0, v12, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    move/from16 v23, v0

    aget v24, v14, v9

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_d

    .line 695
    const/4 v11, 0x1

    .line 696
    const-string v23, "MountService"

    const-string v24, "java process, need kill!"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 689
    .end local v12    # "p":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_e
    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    .line 703
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v9    # "k":I
    .end local v10    # "len":I
    :cond_f
    const-string v23, "MountService"

    const-string v24, "runningList from AMS is null!"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    .line 715
    :cond_10
    const-string v23, "MountService"

    const-string v24, "all native process, don\'t need kill!"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 716
    const/4 v5, 0x1

    goto/16 :goto_4

    .line 719
    .end local v15    # "runningList":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    :cond_11
    const-string v23, "MountService"

    const-string v24, "Fail to get AMS while unmount!"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_4

    .line 730
    .end local v14    # "pids":[I
    :cond_12
    move-object/from16 v0, v21

    iget v0, v0, Lcom/android/server/MountService$UnmountCallBack;->retries:I

    move/from16 v23, v0

    const/16 v24, 0x4

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_13

    .line 731
    const-string v23, "MountService"

    const-string v24, "Failed to unmount media inspite of 4 retries. Forcibly killing processes now"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    :cond_13
    add-int/lit8 v18, v19, 0x1

    .end local v19    # "sizeArrN":I
    .restart local v18    # "sizeArrN":I
    aput v7, v17, v19

    .line 735
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mHandler:Landroid/os/Handler;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$2100(Lcom/android/server/MountService;)Landroid/os/Handler;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v24, v0

    # getter for: Lcom/android/server/MountService;->mHandler:Landroid/os/Handler;
    invoke-static/range {v24 .. v24}, Lcom/android/server/MountService;->access$2100(Lcom/android/server/MountService;)Landroid/os/Handler;

    move-result-object v24

    const/16 v25, 0x3

    move-object/from16 v0, v24

    move/from16 v1, v25

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_3

    .line 740
    .end local v5    # "done":Z
    .end local v11    # "needKill":Z
    .end local v13    # "path":Ljava/lang/String;
    .end local v18    # "sizeArrN":I
    .end local v21    # "ucb":Lcom/android/server/MountService$UnmountCallBack;
    .end local v22    # "volume":Landroid/os/storage/StorageVolume;
    .restart local v19    # "sizeArrN":I
    :cond_14
    add-int/lit8 v7, v19, -0x1

    :goto_7
    if-ltz v7, :cond_0

    .line 741
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->mForceUnmounts:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    aget v24, v17, v7

    invoke-virtual/range {v23 .. v24}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 740
    add-int/lit8 v7, v7, -0x1

    goto :goto_7

    .line 746
    .end local v4    # "ams":Lcom/android/server/am/ActivityManagerService;
    .end local v7    # "i":I
    .end local v16    # "size":I
    .end local v17    # "sizeArr":[I
    .end local v19    # "sizeArrN":I
    :pswitch_2
    const-string v23, "MountService"

    const-string v24, "H_UNMOUNT_MS"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 747
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v21, v0

    check-cast v21, Lcom/android/server/MountService$UnmountCallBack;

    .line 749
    .restart local v21    # "ucb":Lcom/android/server/MountService$UnmountCallBack;
    const/16 v22, 0x0

    .line 750
    .restart local v22    # "volume":Landroid/os/storage/StorageVolume;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mVolumesLock:Ljava/lang/Object;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$700(Lcom/android/server/MountService;)Ljava/lang/Object;

    move-result-object v24

    monitor-enter v24

    .line 751
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # getter for: Lcom/android/server/MountService;->mVolumesByPath:Ljava/util/HashMap;
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$800(Lcom/android/server/MountService;)Ljava/util/HashMap;

    move-result-object v23

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/server/MountService$UnmountCallBack;->path:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    move-object/from16 v0, v23

    check-cast v0, Landroid/os/storage/StorageVolume;

    move-object/from16 v22, v0

    .line 752
    monitor-exit v24
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 753
    if-nez v22, :cond_15

    .line 754
    const-string v23, "MountService"

    const-string v24, "H_UNMOUNT_MS volume is not exist!"

    invoke-static/range {v23 .. v24}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 752
    :catchall_3
    move-exception v23

    :try_start_7
    monitor-exit v24
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    throw v23

    .line 771
    :cond_15
    invoke-virtual/range {v21 .. v21}, Lcom/android/server/MountService$UnmountCallBack;->handleFinished()V

    goto/16 :goto_0

    .line 776
    .end local v21    # "ucb":Lcom/android/server/MountService$UnmountCallBack;
    .end local v22    # "volume":Landroid/os/storage/StorageVolume;
    :pswitch_3
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/MountService$MountServiceHandler;->this$0:Lcom/android/server/MountService;

    move-object/from16 v23, v0

    # invokes: Lcom/android/server/MountService;->handleSystemReady()V
    invoke-static/range {v23 .. v23}, Lcom/android/server/MountService;->access$2200(Lcom/android/server/MountService;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    goto/16 :goto_0

    .line 777
    :catch_0
    move-exception v6

    .line 778
    .local v6, "ex":Ljava/lang/Exception;
    const-string v23, "MountService"

    const-string v24, "Boot-time mount exception"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-static {v0, v1, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 582
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
