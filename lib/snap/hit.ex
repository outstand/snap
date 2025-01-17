defmodule Snap.Hit do
  @moduledoc """
  Represents an individual hit dictionary from a [Search API](https://www.elastic.co/guide/en/elasticsearch/reference/current/search.html) response.
  """
  defstruct ~w[
    index
    type
    id
    score
    source
    fields
    explanation
    matched_queries
    highlight
    inner_hits
  ]a

  def new(response) do
    %__MODULE__{
      index: response["_index"],
      type: response["_type"],
      id: response["_id"],
      score: response["_score"],
      source: response["_source"],
      fields: response["fields"],
      explanation: response["_explanation"],
      matched_queries: response["matched_queries"],
      highlight: response["highlight"],
      inner_hits: response["inner_hits"]
    }
  end

  @type t :: %__MODULE__{
          index: String.t(),
          type: String.t(),
          id: String.t(),
          score: float() | nil,
          source: map() | nil,
          fields: map() | nil,
          explanation: map() | nil,
          matched_queries: list(String.t()) | nil,
          highlight: map() | nil,
          inner_hits: map() | nil
        }
end
