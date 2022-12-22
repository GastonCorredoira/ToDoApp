{include file="header.tpl"}

<div id="wrapper">
    <div id="contenedor">
        <div class="card mb-3 shadow p-3 mb-5 bg-body rounded" id="divContent" style="max-width: 1200px;">
            <div class="row g-0">
                <div class="col-md" style="margin-left: 10px;">
                    <div class="card-body">
                        <form method="POST" action="finishEdit/{$task->id}" name="taskForm" id="taskForm"
                            enctype="multipart/form-data">
                                <h3>Modify album</h3>
                                <h3>Add new album</h3>
                                <div class="mb-3">
                                    <label class="form-label">Album ID</label>
                                    <input type="text" class="form-control" name="id" id="id" readonly>
                                </div>
                            <div class="mb-3">
                                <label class="form-label">Title</label>
                                <input type="text" class="form-control" name="title" id="title" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <input type="text" class="form-control" name="description" id="description" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Priority</label>
                                <input type="text" class="form-control" name="priority" id="priority" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Done</label>
                                <input type="number" class="form-control" name="done" id="done" required>
                            </div>
                            <input type="submit" class="btn btn-warning" value="Send"></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.taskForm.id.value = "{$task->id}";
    document.taskForm.title.value = "{$task->title}";
    document.taskForm.description.value = "{$task->description}";
    document.taskForm.priority.value = "{$task->priority}";
    document.taskForm.genre.value = "{$task->done}";
</script>

{include file="footer.tpl"}