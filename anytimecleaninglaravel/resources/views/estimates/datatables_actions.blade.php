<div class='btn-group btn-group-sm'>
    @can('estimates.show')
        <a data-toggle="tooltip" data-placement="left" title="{{trans('lang.view_details')}}" href="{{ route('estimates.show', $id) }}" class='btn btn-link'>
            <i class="fas fa-eye"></i> </a> @endcan

    <!-- @can('estimates.index')
        <a data-toggle="tooltip" data-placement="left" title="{{trans('lang.booking_status_edit')}}" href="{{ route('estimates.edit', $id) }}" class='btn btn-link'>
            <i class="fas fa-edit"></i> </a> @endcan -->

    @can('estimates.destroy') {!! Form::open(['route' => ['estimates.destroy', $id], 'method' => 'delete']) !!} {!! Form::button('<i class="fas fa-trash"></i>', [ 'type' => 'submit', 'class' => 'btn btn-link text-danger', 'onclick' => "return confirm('Are you sure?')" ]) !!} {!! Form::close() !!} @endcan
</div>
