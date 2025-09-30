class ApplicationAgent < ActiveAgent::Base
  layout "agent"

  generate_with :ollama, model: "ai/smollm2", instructions: "You are a precise assistant. When you receive a request, respond to it exactly as specified. Do not add any preamble or other content to your response"
end

