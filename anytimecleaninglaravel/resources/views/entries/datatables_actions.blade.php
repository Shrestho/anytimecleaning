<div class='btn-group btn-group-sm'>
    @can('entries.show')
        <a data-toggle="tooltip" data-placement="left" title="{{trans('lang.view_details')}}" href="{{ route('entries.show', $id) }}" class='btn btn-link'>
            <i class="fas fa-eye"></i> </a> @endcan

    <!-- @can('entries.index')
        <a data-toggle="tooltip" data-placement="left" title="{{trans('lang.booking_status_edit')}}" href="{{ route('entries.edit', $id) }}" class='btn btn-link'>
            <i class="fas fa-edit"></i> </a> @endcan -->

    @can('entries.destroy') {!! Form::open(['route' => ['entries.destroy', $id], 'method' => 'delete']) !!} {!! Form::button('<i class="fas fa-trash"></i>', [ 'type' => 'submit', 'class' => 'btn btn-link text-danger', 'onclick' => "return confirm('Are you sure?')" ]) !!} {!! Form::close() !!} @endcan
</div>
