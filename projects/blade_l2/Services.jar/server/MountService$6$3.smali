.class Lcom/android/server/MountService$6$3;
.super Ljava/lang/Thread;
.source "MountService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/MountService$6;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/MountService$6;


# direct methods
.method constructor <init>(Lcom/android/server/MountService$6;)V
    .locals 0

    .prologue
    .line 1087
    iput-object p1, p0, Lcom/android/server/MountService$6$3;->this$1:Lcom/android/server/MountService$6;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    const/16 v11, 0x1e

    .line 1089
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v6

    .line 1090
    .local v6, "tempVolumes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/storage/StorageVolume;>;"
    iget-object v8, p0, Lcom/android/server/MountService$6$3;->this$1:Lcom/android/server/MountService$6;

    iget-object v8, v8, Lcom/android/server/MountService$6;->this$0:Lcom/android/server/MountService;

    # getter for: Lcom/android/server/MountService;->mVolumesLock:Ljava/lang/Object;
    invoke-static {v8}, Lcom/android/server/MountService;->access$700(Lcom/android/server/MountService;)Ljava/lang/Object;

    move-result-object v9

    monitor-enter v9

    .line 1091
    :try_start_0
    iget-object v8, p0, Lcom/android/server/MountService$6$3;->this$1:Lcom/android/server/MountService$6;

    iget-object v8, v8, Lcom/android/server/MountService$6;->this$0:Lcom/android/server/MountService;

    # getter for: Lcom/android/server/MountService;->mVolumes:Ljava/util/ArrayList;
    invoke-static {v8}, Lcom/android/server/MountService;->access$2400(Lcom/android/server/MountService;)Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/storage/StorageVolume;

    .line 1092
    .local v7, "volume":Landroid/os/storage/StorageVolume;
    invoke-virtual {v7}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v8

    # getter for: Lcom/android/server/MountService;->EXTERNAL_OTG:Ljava/lang/String;
    invoke-static {}, Lcom/android/server/MountService;->access$3300()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    invoke-virtual {v7}, Landroid/os/storage/StorageVolume;->isEmulated()Z

    move-result v8

    if-nez v8, :cond_0

    .line 1093
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1096
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v7    # "volume":Landroid/os/storage/StorageVolume;
    :catchall_0
    move-exception v8

    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v8

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1098
    const/4 v5, 0x0

    .line 1099
    .local v5, "state":Ljava/lang/String;
    const/4 v4, 0x0

    .line 1100
    .local v4, "path":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/storage/StorageVolume;

    .line 1101
    .restart local v7    # "volume":Landroid/os/storage/StorageVolume;
    invoke-virtual {v7}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 1102
    iget-object v8, p0, Lcom/android/server/MountService$6$3;->this$1:Lcom/android/server/MountService$6;

    iget-object v8, v8, Lcom/android/server/MountService$6;->this$0:Lcom/android/server/MountService;

    invoke-virtual {v8, v4}, Lcom/android/server/MountService;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1103
    const-string v8, "MountService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Privacy Protection wipe: path "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "is "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1105
    const-string v8, "checking"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 1106
    const-string v8, "MountService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Privacy Protection wipe: path "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "is checking, wait.."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1107
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    if-ge v1, v11, :cond_3

    .line 1109
    const-wide/16 v8, 0x3e8

    :try_start_2
    invoke-static {v8, v9}, Lcom/android/server/MountService$6$3;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 1113
    :goto_3
    iget-object v8, p0, Lcom/android/server/MountService$6$3;->this$1:Lcom/android/server/MountService$6;

    iget-object v8, v8, Lcom/android/server/MountService$6;->this$0:Lcom/android/server/MountService;

    invoke-virtual {v8, v4}, Lcom/android/server/MountService;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1114
    const-string v8, "checking"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    .line 1115
    const-string v8, "MountService"

    const-string v9, "Privacy Protection wipe: wait checking done!"

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1121
    .end local v1    # "i":I
    :cond_3
    const-string v8, "mounted"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 1122
    const-string v8, "MountService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Privacy Protection wipe: path "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "is mounted, wait.."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1123
    iget-object v8, p0, Lcom/android/server/MountService$6$3;->this$1:Lcom/android/server/MountService$6;

    iget-object v8, v8, Lcom/android/server/MountService$6;->this$0:Lcom/android/server/MountService;

    const/4 v9, 0x1

    invoke-virtual {v8, v4, v9, v12}, Lcom/android/server/MountService;->unmountVolumeNotSwap(Ljava/lang/String;ZZ)V

    .line 1124
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_4
    if-ge v1, v11, :cond_4

    .line 1126
    const-wide/16 v8, 0x3e8

    :try_start_3
    invoke-static {v8, v9}, Lcom/android/server/MountService$6$3;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 1130
    :goto_5
    iget-object v8, p0, Lcom/android/server/MountService$6$3;->this$1:Lcom/android/server/MountService$6;

    iget-object v8, v8, Lcom/android/server/MountService$6;->this$0:Lcom/android/server/MountService;

    invoke-virtual {v8, v4}, Lcom/android/server/MountService;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1131
    const-string v8, "unmounted"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 1132
    const-string v8, "MountService"

    const-string v9, "Privacy Protection wipe: wait unmount done!"

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1138
    .end local v1    # "i":I
    :cond_4
    const-string v8, "shared"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 1139
    const-string v8, "MountService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Privacy Protection wipe: path "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "is shared, wait.."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1140
    iget-object v8, p0, Lcom/android/server/MountService$6$3;->this$1:Lcom/android/server/MountService$6;

    iget-object v8, v8, Lcom/android/server/MountService$6;->this$0:Lcom/android/server/MountService;

    const-string v9, "ums"

    # invokes: Lcom/android/server/MountService;->doShareUnshareVolume(Ljava/lang/String;Ljava/lang/String;Z)V
    invoke-static {v8, v4, v9, v12}, Lcom/android/server/MountService;->access$1200(Lcom/android/server/MountService;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1141
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_6
    if-ge v1, v11, :cond_5

    .line 1143
    const-wide/16 v8, 0x3e8

    :try_start_4
    invoke-static {v8, v9}, Lcom/android/server/MountService$6$3;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 1147
    :goto_7
    iget-object v8, p0, Lcom/android/server/MountService$6$3;->this$1:Lcom/android/server/MountService$6;

    iget-object v8, v8, Lcom/android/server/MountService$6;->this$0:Lcom/android/server/MountService;

    invoke-virtual {v8, v4}, Lcom/android/server/MountService;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1148
    const-string v8, "unmounted"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 1149
    const-string v8, "MountService"

    const-string v9, "Privacy Protection wipe: wait unshare done!"

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1155
    .end local v1    # "i":I
    :cond_5
    const-string v8, "unmounted"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 1156
    const-string v8, "MountService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Privacy Protection wipe: format "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1157
    iget-object v8, p0, Lcom/android/server/MountService$6$3;->this$1:Lcom/android/server/MountService$6;

    iget-object v8, v8, Lcom/android/server/MountService$6;->this$0:Lcom/android/server/MountService;

    # invokes: Lcom/android/server/MountService;->doFormatVolume(Ljava/lang/String;)I
    invoke-static {v8, v4}, Lcom/android/server/MountService;->access$3400(Lcom/android/server/MountService;Ljava/lang/String;)I

    .line 1158
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_8
    if-ge v1, v11, :cond_2

    .line 1160
    const-wide/16 v8, 0x3e8

    :try_start_5
    invoke-static {v8, v9}, Lcom/android/server/MountService$6$3;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 1164
    :goto_9
    iget-object v8, p0, Lcom/android/server/MountService$6$3;->this$1:Lcom/android/server/MountService$6;

    iget-object v8, v8, Lcom/android/server/MountService$6;->this$0:Lcom/android/server/MountService;

    invoke-virtual {v8, v4}, Lcom/android/server/MountService;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1165
    const-string v8, "unmounted"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 1166
    const-string v8, "MountService"

    const-string v9, "Privacy Protection wipe: format done!"

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 1110
    :catch_0
    move-exception v0

    .line 1111
    .local v0, "ex":Ljava/lang/Exception;
    const-string v8, "MountService"

    const-string v9, "Exception when wait!"

    invoke-static {v8, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3

    .line 1107
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_2

    .line 1127
    :catch_1
    move-exception v0

    .line 1128
    .restart local v0    # "ex":Ljava/lang/Exception;
    const-string v8, "MountService"

    const-string v9, "Exception when wait!"

    invoke-static {v8, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_5

    .line 1124
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_4

    .line 1144
    :catch_2
    move-exception v0

    .line 1145
    .restart local v0    # "ex":Ljava/lang/Exception;
    const-string v8, "MountService"

    const-string v9, "Exception when wait!"

    invoke-static {v8, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_7

    .line 1141
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_8
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_6

    .line 1161
    :catch_3
    move-exception v0

    .line 1162
    .restart local v0    # "ex":Ljava/lang/Exception;
    const-string v8, "MountService"

    const-string v9, "Exception when wait!"

    invoke-static {v8, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9

    .line 1158
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_9
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 1173
    .end local v1    # "i":I
    .end local v7    # "volume":Landroid/os/storage/StorageVolume;
    :cond_a
    new-instance v3, Landroid/content/Intent;

    const-string v8, "com.mediatek.ppl.MOUNT_SERVICE_WIPE_RESPONSE"

    invoke-direct {v3, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1174
    .local v3, "intent":Landroid/content/Intent;
    iget-object v8, p0, Lcom/android/server/MountService$6$3;->this$1:Lcom/android/server/MountService$6;

    iget-object v8, v8, Lcom/android/server/MountService$6;->this$0:Lcom/android/server/MountService;

    # getter for: Lcom/android/server/MountService;->mContext:Landroid/content/Context;
    invoke-static {v8}, Lcom/android/server/MountService;->access$3500(Lcom/android/server/MountService;)Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1175
    const-string v8, "MountService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Privacy Protection wipe: send "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1176
    return-void
.end method
