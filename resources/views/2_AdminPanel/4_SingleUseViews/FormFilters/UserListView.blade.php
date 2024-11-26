<div class="table-filter-wrap mb-4">
    <form>
        <div class="row">
            <div class="col">
                <input type="number" class="form-control" placeholder="Search by user id" name="customer_id"
                    data-type="search">
            </div>
            <div class="col">
                <input type="text" class="form-control" placeholder="Search by name" name="name"
                    data-type="search">
            </div>
            <div class="col">
                <input type="number" class="form-control" placeholder="Search by phone" name="phone"
                    data-type="search">
            </div>
            <div class="col">
                {{-- <input type="text" id="input-filter" class="form-control" placeholder="Search by status"
                    name="active" data-type="search"> --}}
                <select id="select-filter" class="form-select" name="active" data-type="search">
                    <option value="">Select by status</option>
                    <option value="1">Active</option>
                    <option value="0">InActive</option>
                </select>
            </div>
        </div>
    </form>
</div>
