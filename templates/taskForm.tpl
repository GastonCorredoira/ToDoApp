{include file="header.tpl"}

<div class="container text-center">
    <div class="card shadow mb-5 bg-body rounded" style="margin-top: 30px;">
        <div class="card-body">
            <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                            Add new task
                        </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
                        data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">

                            <h5 class="card-title">Add new task</h5>
                            <form method="POST" action="addTask" name="addTask" id="addTask"
                                enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label class="form-label">Title</label>
                                    <input type="text" class="form-control" name="title" id="title" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Description</label>
                                    <input type="text" class="form-control" name="description" id="description"
                                        required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Priority</label>
                                    <input type="text" class="form-control" name="priority" id="priority" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Done</label>
                                    <input type="number" class="form-control" name="done" id="done" required>
                                </div>
                                <input type="submit" id="signUpBtn" value="Add task"></button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{if $type == "edit"}
    <script>
        document.albumForm.id.value = "{$album->id}";
        document.albumForm.albumname.value = "{$album->albumname}";
        document.albumForm.artist.value = "{$album->artist}";
        document.albumForm.genre.value = "{$album->genre}";
        document.albumForm.year.value = "{$album->year}";
    </script>
{/if}

{include file="footer.tpl"}