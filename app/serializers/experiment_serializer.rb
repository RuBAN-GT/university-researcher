class ExperimentSerializer < ActiveModel::Serializer
  attributes :id,
    :sequence,
    :position_id,
    :genbank_id,
    :created_at,
    :position_id
end
